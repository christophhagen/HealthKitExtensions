import Foundation
import HealthKit
import CoreLocation

extension HealthStore {

    // MARK: Workouts

    /**
     Query for workouts.
     - Parameter activityType: Constrain the query to return only workouts with the activity type. Set to `nil` to return all workouts.
     - Parameter start: The start date of the relevant interval
     - Parameter end: The end date of the relevant interval
     - Parameter sortingMethod: Indicate how the workouts should be sorted
     - Parameter limit: The maximum number of workouts returned by the query.
     - Returns: An array containing the workouts found by the query
     */
    public func workouts(activityType: HKWorkoutActivityType? = nil, from start: Date = .distantPast, to end: Date = .distantFuture, sortedBy sortingMethod: SampleSortingMethod? = nil, limitedTo limit: Int? = nil) async throws -> [HKWorkout] {
        let predicate = HKQuery.predicateForSamples(withStart: start, end: end)
            .and(activityType?.workoutPredicate)

        return try await sampleQuery(
            sampleType: .workoutType(),
            filteredWith: predicate,
            sortedBy: sortingMethod,
            limitedTo: limit)
        .compactMap { $0 as? HKWorkout }
    }

    //MARK: Workout route

    /**
     Get the route associated with a workout.
     - Note: No updates to the route are processed, it only returns the initial sample.
     */
    public func route(associatedWith workout: HKWorkout) async throws -> HKWorkoutRoute? {
        let runningObjectQuery = HKQuery.predicateForObjects(from: workout)
        return try await withCheckedThrowingContinuation { continuation in
            let routeQuery = HKAnchoredObjectQuery(
                type: HKSeriesType.workoutRoute(),
                predicate: runningObjectQuery,
                anchor: nil,
                limit: HKObjectQueryNoLimit) { (_, samples, _, _, error) in
                    if let error {
                        continuation.resume(throwing: error)
                        return
                    }
                    guard let samples else {
                        continuation.resume(returning: nil)
                        return
                    }
                    for sample in samples {
                        if let route = sample as? HKWorkoutRoute {
                            continuation.resume(returning: route)
                            return
                        }
                    }
                    continuation.resume(returning: nil)
            }
            // routeQuery.updateHandler = { (query, samples, deleted, anchor, error) in
            //     // Process updates
            // }
            store.execute(routeQuery)
        }
    }

    // MARK: Route locations

    /**
     Access the locations associated with a workout route.
     - Parameter route: The route for which to get location samples
     - Returns: All location samples associated with the route.
     */
    public func locations(associatedWith route: HKWorkoutRoute) async throws -> [CLLocation] {
        return try await withCheckedThrowingContinuation { continuation in
            var locations: [CLLocation] = []
            var didFinish = false

            func resume(throwing error: Error) {
                guard !didFinish else { return }
                didFinish = true
                continuation.resume(throwing: error)
            }
            func finish() {
                guard !didFinish else { return }
                didFinish = true
                continuation.resume(returning: locations)
            }
            let query = HKWorkoutRouteQuery(route: route) { (_, newLocations, done, error) in
                if let error {
                    resume(throwing: error)
                    return
                }
                guard let newLocations else {
                    resume(throwing: HKError(.unknownError))
                    return
                }
                locations += newLocations

                guard done else {
                    return
                }
                finish()
            }
            store.execute(query)
        }
    }

    // MARK: Workout data

    /**
     Get samples of a specific type associated with a workout.

     - Note: This function automatically queries additional data for condensed samples.
     */
    public func samples<T>(associatedWith workout: HKWorkout) async throws -> [T] where T: HKQuantitySampleContainer {

        let forWorkout = HKQuery.predicateForObjects(from: workout)

        let sampleDescriptor = HKQueryDescriptor(
            sampleType: T.quantitySampleType,
            predicate: forWorkout)

        let samples = try await sampleQuery([sampleDescriptor])
        let converted: [HKSample] = try await samples.mapAndJoin { sample in
            guard let series = sample as? HKDiscreteQuantitySample else {
                return [sample]
            }
            guard series.count > 1 else {
                return [sample]
            }
            return try await seriesSamples(associatedWith: series)
                .map {
                    HKQuantitySample(
                        type: series.quantityType,
                        quantity: $0.quantity,
                        start: $0.dateInterval.start,
                        end: $0.dateInterval.end,
                        device: series.device,
                        metadata: series.metadata)
                }
        }
        return converted.map { T.init(sample: $0) }
    }

    /**
     Get the samples associated with a condensed sample.

     - Note: Only call this function for samples where `count` is larger than `1`.
     */
    public func seriesSamples<T>(associatedWith series: T) async throws -> [T] where T: HKDiscreteQuantity {
        try await seriesSamples(associatedWith: series.quantitySample).map { (dateInterval, quantity) in
            T.init(quantity: quantity, start: dateInterval.start, end: dateInterval.end)
        }
    }

    /**
     Query the samples associated with a condensed sample.
     - Parameter series: The condensed sample
     - Returns: A list of quantities with their associated date intervals.
     */
    public func seriesSamples(associatedWith series: HKQuantitySample) async throws -> [(dateInterval: DateInterval, quantity: HKQuantity)] {
        let inSeriesSample = HKQuery.predicateForObject(with: series.uuid)

        return try await withCheckedThrowingContinuation { continuation in
            var samples = [(dateInterval: DateInterval, quantity: HKQuantity)]()

            let detailQuery = HKQuantitySeriesSampleQuery(
                quantityType: series.quantityType,
                predicate: inSeriesSample)
            { _, quantity, dateInterval, _, done, error in
                if let error {
                    continuation.resume(throwing: error)
                    return
                }
                guard let quantity = quantity, let dateInterval = dateInterval else {
                    continuation.resume(throwing: HKError(.unknownError))
                    return
                }
                samples.append((dateInterval, quantity))

                guard done else {
                    return
                }
                continuation.resume(returning: samples)
            }
            store.execute(detailQuery)
        }
    }
}

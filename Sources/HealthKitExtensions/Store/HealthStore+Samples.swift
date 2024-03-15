import Foundation
import HealthKit

extension HealthStore {

    /**
     Saves the provided object to the HealthKit store.

     - Parameter object: The HealthKit object to be saved. This object can be any concrete type conforming to the ``HKObjectContainer`` protocol.

     If your app has not requested permission to share the object’s data type, the method fails with an ``HKError.Code.errorAuthorizationNotDetermined`` error.
     If your app has been denied permission to save the object’s data type, it fails with an ``HKError.Code.errorAuthorizationDenied`` error.
     Saving an object with the same unique identifier as an object already in the HealthKit store fails with an ``HKError.Code.errorInvalidArgument`` error.
     When saving multiple objects, if any object cannot be saved, none of them are saved.

     In iOS 9.0 and later, saving an object to the HealthKit store sets the object’s ``sourceRevision`` property to a ``HKSourceRevision`` instance representing the saving app.
     On earlier versions of iOS, saving an object sets the ``source`` property to a ``HKSource`` instance instead.
     In both cases, these values are available only after the object is retrieved from the HealthKit store.
     The original object is not changed.

     All samples retrieved by iOS 9.0 and later are given a valid ``sourceRevision`` property.
     If the sample was saved using an earlier version of iOS, the source revision’s version is set to `nil`.
     */
    @available(iOS 13.0.0, *)
    public func save(_ sample: HKSampleContainer) async throws {
        try await store.save(sample.sample)
    }

    /**
     Saves an array of objects to the HealthKit store.

     - Parameter objects: An array containing concrete type conforming to the ``HKObjectContainer`` protocol.

     If your app has not requested permission to share the object’s data type, the method fails with an ``HKError.Code.errorAuthorizationNotDetermined`` error.
     If your app has been denied permission to save the object’s data type, it fails with an ``HKError.Code.errorAuthorizationDenied`` error.
     Saving an object with the same unique identifier as an object already in the HealthKit store fails with an ``HKError.Code.errorInvalidArgument`` error.
     When saving multiple objects, if any object cannot be saved, none of them are saved.
     
     In iOS 9.0 and later, saving an object to the HealthKit store sets the object’s ``sourceRevision`` property to a ``HKSourceRevision`` instance representing the saving app.
     On earlier versions of iOS, saving an object sets the ``source`` property to a ``HKSource`` instance instead.
     In both cases, these values are available only after the object is retrieved from the HealthKit store.
     The original object is not changed.
     
     All samples retrieved by iOS 9.0 and later are given a valid ``sourceRevision`` property.
     If the sample was saved using an earlier version of iOS, the source revision’s version is set to `nil`.
     */
    public func save(_ samples: [HKSampleContainer]) async throws {
        try await store.save(samples.map { $0.sample })
    }

    // MARK: Quantity samples

    /**
     Read quantity samples.
     - Parameter start: The start date of the relevant interval
     - Parameter end: The end date of the relevant interval
     - Parameter sortingMethod: Indicate how the samples should be sorted
     - Parameter limit: The maximum number of workouts returned by the query.
     - Returns: An array containing the samples found by the query
     */
    @available(iOS 15.4, *)
    public func read<T>(from start: Date = .distantPast, to end: Date = .distantFuture, sortedBy sortingMethod: SampleSortingMethod? = nil, limitedTo limit: Int? = nil) async throws -> [T] where T: HKQuantitySampleContainer {
        let predicate = HKQuery.predicateForSamples(withStart: start, end: end, options: [])
        let sorting = sortingMethod.map { [$0.sampleSortDescriptor(sorting: HKQuantitySample.self)] }
        return try await read(
            predicate: predicate,
            sortDescriptors: sorting ?? [],
            limit: limit)
    }

    /**
     Read quantity samples.
     */
    @available(iOS 15.4, *)
    public func read<T>(predicate: NSPredicate? = nil, sortDescriptors: [SortDescriptor<HKQuantitySample>] = [], limit: Int? = nil) async throws -> [T] where T: HKQuantitySampleContainer {

        let descriptor = HKSampleQueryDescriptor(
            predicates: [.quantitySample(type: T.quantitySampleType, predicate: predicate)],
            sortDescriptors: sortDescriptors,
            limit: limit)

        let results = try await descriptor.result(for: store)
        return results.map { T.init(sample: $0) }
    }

    // MARK: Correlation samples

    /**
     Read correlation samples.
     - Parameter start: The start date of the relevant interval
     - Parameter end: The end date of the relevant interval
     - Parameter sortingMethod: Indicate how the samples should be sorted
     - Parameter limit: The maximum number of workouts returned by the query.
     - Returns: An array containing the samples found by the query
     */
    @available(iOS 15.4, *)
    public func read<T>(from start: Date = .distantPast, to end: Date = .distantFuture, sortedBy sortingMethod: SampleSortingMethod? = nil, limitedTo limit: Int? = nil) async throws -> [T] where T: HKCorrelationContainer {
        let predicate = HKQuery.predicateForSamples(withStart: start, end: end, options: [])
        let sorting = sortingMethod.map { [$0.sampleSortDescriptor(sorting: HKCorrelation.self)] }
        return try await read(
            predicate: predicate,
            sortDescriptors: sorting ?? [],
            limit: limit)
    }

    /**
     Read correlation samples.
     */
    @available(iOS 15.4, *)
    public func read<T>(predicate: NSPredicate? = nil, sortDescriptors: [SortDescriptor<HKCorrelation>] = [], limit: Int? = nil) async throws -> [T] where T: HKCorrelationContainer {

        let descriptor = HKSampleQueryDescriptor(
            predicates: [.correlation(type: T.correlationType, predicate: predicate)],
            sortDescriptors: sortDescriptors,
            limit: limit)

        let results = try await descriptor.result(for: store)
        return results.map { T.init(sample: $0) }
    }

    // MARK: Category samples

    /**
     Read category samples.
     - Parameter start: The start date of the relevant interval
     - Parameter end: The end date of the relevant interval
     - Parameter sortingMethod: Indicate how the samples should be sorted
     - Parameter limit: The maximum number of workouts returned by the query.
     - Returns: An array containing the samples found by the query
     */
    @available(iOS 15.4, *)
    public func read<T>(from start: Date = .distantPast, to end: Date = .distantFuture, sortedBy sortingMethod: SampleSortingMethod? = nil, limitedTo limit: Int? = nil) async throws -> [T] where T: HKCategorySampleContainer {
        let predicate = HKQuery.predicateForSamples(withStart: start, end: end, options: [])
        let sorting = sortingMethod.map { [$0.sampleSortDescriptor(sorting: HKCategorySample.self)] }
        return try await read(
            predicate: predicate,
            sortDescriptors: sorting ?? [],
            limit: limit)
    }

    /**
     Read category samples.
     */
    @available(iOS 15.4, *)
    public func read<T>(predicate: NSPredicate? = nil, sortDescriptors: [SortDescriptor<HKCategorySample>] = [], limit: Int? = nil) async throws -> [T] where T: HKCategorySampleContainer {

        let descriptor = HKSampleQueryDescriptor(
            predicates: [.categorySample(type: T.categorySampleType, predicate: predicate)],
            sortDescriptors: sortDescriptors,
            limit: limit)

        let results = try await descriptor.result(for: store)
        return results.map { T.init(sample: $0) }
    }

}

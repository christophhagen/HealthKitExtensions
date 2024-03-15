import Foundation
import HealthKit

extension HealthStore {

    // MARK: Samples

    /**
     Construct and execute a sample query.
     */
    public func sampleQuery(_ queryDescriptors: [HKQueryDescriptor], limit: Int? = nil) async throws -> [HKSample] {
        try await withCheckedThrowingContinuation { continuation in
            let query = HKSampleQuery(
                queryDescriptors: queryDescriptors,
                limit: limit ?? HKObjectQueryNoLimit)
            { query, samples, error in
                if let error {
                    continuation.resume(throwing: error)
                    return
                }
                guard let samples else {
                    continuation.resume(returning: [])
                    return
                }
                continuation.resume(returning: samples)
            }
            store.execute(query)
        }
    }

    public func sampleQuery(sampleType: HKSampleType, filteredWith predicate: NSPredicate? = nil, sortedBy sortingMethod: SampleSortingMethod? = nil, limitedTo limit: Int? = nil) async throws -> [HKSample] {
        let sortDescriptors = sortingMethod.map { [$0.descriptor] }
        return try await withCheckedThrowingContinuation { continuation in
            let query = HKSampleQuery(
                sampleType: sampleType,
                predicate: predicate,
                limit: limit ?? HKObjectQueryNoLimit,
                sortDescriptors: sortDescriptors) { _, samples, error in
                    if let error {
                        continuation.resume(throwing: error)
                        return
                    }
                    guard let samples = samples else {
                        continuation.resume(returning: [])
                        return
                    }
                    continuation.resume(returning: samples)
                }
            store.execute(query)
        }
    }
}

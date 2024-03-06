import Foundation
import HealthKit

/**
 A quantity sample type that measures the number of NikeFuel points the user has earned.

 These samples use count units (described in ``HKUnit``) and measure cumulative values (described in ``HKQuantityAggregationStyle``).

 The default unit is count.
 */
public struct NikeFuel: HKCumulativeCount {

    public static let quantityTypeIdentifier: HKQuantityTypeIdentifier = .nikeFuel

    public let cumulativeQuantitySample: HKCumulativeQuantitySample

    public init(cumulativeQuantitySample: HKCumulativeQuantitySample) {
        self.cumulativeQuantitySample = cumulativeQuantitySample
    }
}

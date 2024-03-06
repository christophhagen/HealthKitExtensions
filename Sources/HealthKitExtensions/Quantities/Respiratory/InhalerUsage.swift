import Foundation
import HealthKit

/**
 A quantity sample type that measures the number of puffs the user takes from their inhaler.

 These samples use count units (described in ``HKUnit``) and measure cumulative values (described in ``HKQuantityAggregationStyle``).

 The default unit is count.
 */
public struct InhalerUsage: HKCumulativeCount {

    public static let quantityTypeIdentifier: HKQuantityTypeIdentifier = .inhalerUsage

    public let cumulativeQuantitySample: HKCumulativeQuantitySample

    public init(cumulativeQuantitySample: HKCumulativeQuantitySample) {
        self.cumulativeQuantitySample = cumulativeQuantitySample
    }
}

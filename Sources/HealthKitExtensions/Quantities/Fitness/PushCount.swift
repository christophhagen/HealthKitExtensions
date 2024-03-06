import Foundation
import HealthKit

/**
 A quantity sample type that measures the number of pushes that the user has performed while using a wheelchair.

 These samples use count units (described in ``HKUnit``) and measure cumulative values (described in ``HKQuantityAggregationStyle``).

 The default unit is count.
 */
public struct PushCount: HKCumulativeCount {

    public static let quantityTypeIdentifier: HKQuantityTypeIdentifier = .pushCount

    public let cumulativeQuantitySample: HKCumulativeQuantitySample

    public init(cumulativeQuantitySample: HKCumulativeQuantitySample) {
        self.cumulativeQuantitySample = cumulativeQuantitySample
    }
}

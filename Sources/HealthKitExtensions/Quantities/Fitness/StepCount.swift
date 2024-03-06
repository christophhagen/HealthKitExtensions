import Foundation
import HealthKit

/**
 A quantity sample type that measures the number of steps the user has taken.

 These samples use count units (described in ``HKUnit``) and measure cumulative values (described in ``HKQuantityAggregationStyle``).

 The default unit is count.
 */
public struct StepCount: HKCumulativeCount {

    public static let quantityTypeIdentifier: HKQuantityTypeIdentifier = .stepCount

    public let cumulativeQuantitySample: HKCumulativeQuantitySample

    public init(cumulativeQuantitySample: HKCumulativeQuantitySample) {
        self.cumulativeQuantitySample = cumulativeQuantitySample
    }
}

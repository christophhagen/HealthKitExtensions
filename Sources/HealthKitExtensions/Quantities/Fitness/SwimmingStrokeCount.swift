import Foundation
import HealthKit

/**
 A quantity sample type that measures the number of strokes performed while swimming.

 These samples use count units (described in ``HKUnit``) and measure cumulative values (described in ``HKQuantityAggregationStyle``).

 The default unit is count.
 */
public struct SwimmingStrokeCount: HKCumulativeCount {

    public static let quantityTypeIdentifier: HKQuantityTypeIdentifier = .swimmingStrokeCount

    public let cumulativeQuantitySample: HKCumulativeQuantitySample

    public init(cumulativeQuantitySample: HKCumulativeQuantitySample) {
        self.cumulativeQuantitySample = cumulativeQuantitySample
    }
}

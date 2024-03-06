import Foundation
import HealthKit

/**
 A quantity sample type that measures the distance the user has moved while swimming.

 These samples use length units (described in ``HKUnit``) and measure cumulative values (described in ``HKQuantityAggregationStyle``).

 The default unit is meter.
 */
public struct DistanceSwimming: HKCumulativeDistance {

    public static let quantityTypeIdentifier: HKQuantityTypeIdentifier = .distanceSwimming

    public let cumulativeQuantitySample: HKCumulativeQuantitySample

    public init(cumulativeQuantitySample: HKCumulativeQuantitySample) {
        self.cumulativeQuantitySample = cumulativeQuantitySample
    }
}

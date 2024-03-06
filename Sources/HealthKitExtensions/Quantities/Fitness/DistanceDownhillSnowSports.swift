import Foundation
import HealthKit

/**
 A quantity sample type that measures the distance the user has traveled while skiing or snowboarding.

 These samples use length units (described in ``HKUnit``) and measure cumulative values (described in ``HKQuantityAggregationStyle``).

 The default unit is meter.
 */
public struct DistanceDownhillSnowSports: HKCumulativeDistance {

    public static let quantityTypeIdentifier: HKQuantityTypeIdentifier = .distanceDownhillSnowSports

    public let cumulativeQuantitySample: HKCumulativeQuantitySample

    public init(cumulativeQuantitySample: HKCumulativeQuantitySample) {
        self.cumulativeQuantitySample = cumulativeQuantitySample
    }
}

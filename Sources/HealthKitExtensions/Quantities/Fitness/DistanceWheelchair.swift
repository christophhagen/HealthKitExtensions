import Foundation
import HealthKit

/**
 A quantity sample type that measures the distance the user has moved using a wheelchair.

 These samples use length units (described in ``HKUnit``) and measure cumulative values (described in ``HKQuantityAggregationStyle``).

 The default unit is meter.
 */
public struct DistanceWheelchair: HKCumulativeDistance {

    public static let quantityTypeIdentifier: HKQuantityTypeIdentifier = .distanceWheelchair

    public let cumulativeQuantitySample: HKCumulativeQuantitySample

    public init(cumulativeQuantitySample: HKCumulativeQuantitySample) {
        self.cumulativeQuantitySample = cumulativeQuantitySample
    }
}

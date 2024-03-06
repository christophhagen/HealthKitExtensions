import Foundation
import HealthKit

/**
 A quantity sample type that measures the distance the user has moved by cycling.
 
 These samples use length units (described in ``HKUnit``) and measure cumulative values (described in ``HKQuantityAggregationStyle``).

 The default unit is meter.
 */
public struct DistanceCycling: HKCumulativeDistance {

    public static let quantityTypeIdentifier: HKQuantityTypeIdentifier = .distanceCycling

    public let cumulativeQuantitySample: HKCumulativeQuantitySample

    public init(cumulativeQuantitySample: HKCumulativeQuantitySample) {
        self.cumulativeQuantitySample = cumulativeQuantitySample
    }
}

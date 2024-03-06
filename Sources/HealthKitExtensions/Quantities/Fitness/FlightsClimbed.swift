import Foundation
import HealthKit

/**
 A quantity sample type that measures the number flights of stairs that the user has climbed.

 These samples use count units (described in ``HKUnit``) and measure cumulative values (described in ``HKQuantityAggregationStyle``).

 The default unit is count.
 */
public struct FlightsClimbed: HKCumulativeCount {

    public static let quantityTypeIdentifier: HKQuantityTypeIdentifier = .flightsClimbed

    public let cumulativeQuantitySample: HKCumulativeQuantitySample

    public init(cumulativeQuantitySample: HKCumulativeQuantitySample) {
        self.cumulativeQuantitySample = cumulativeQuantitySample
    }
}

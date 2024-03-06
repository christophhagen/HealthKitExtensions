import Foundation
import HealthKit

/**
 A quantity sample type that measures the user’s maximum flow rate generated during a forceful exhalation.

 These samples use volume/time units (described in ``HKUnit``) and measure discrete values (described in ``HKQuantityAggregationStyle``).

 The default unit is L/min.
 */
public struct PeakExpiratoryFlowRate: HKDiscreteQuantity {

    public static let quantityTypeIdentifier: HKQuantityTypeIdentifier = .peakExpiratoryFlowRate

    /// L/min
    public static let defaultUnit: HKUnit = .liter().unitDivided(by: .minute())

    public let discreteQuantitySample: HKDiscreteQuantitySample

    public init(discreteQuantitySample: HKDiscreteQuantitySample) {
        self.discreteQuantitySample = discreteQuantitySample
    }
}

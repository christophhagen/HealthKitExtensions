import Foundation
import HealthKit

/**
 A quantity sample type that measures the user’s respiratory rate.

 These samples use count/time units (described in ``HKUnit``) and measure discrete values (described in ``HKQuantityAggregationStyle``).

 The default unit is count/s.
 */
public struct RespiratoryRate: HKDiscreteQuantity {

    public static let quantityTypeIdentifier: HKQuantityTypeIdentifier = .respiratoryRate

    /// count/s
    public static let defaultUnit: HKUnit = .count().unitDivided(by: .second())

    public let discreteQuantitySample: HKDiscreteQuantitySample

    public init(discreteQuantitySample: HKDiscreteQuantitySample) {
        self.discreteQuantitySample = discreteQuantitySample
    }
}

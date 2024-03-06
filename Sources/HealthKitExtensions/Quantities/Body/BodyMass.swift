import Foundation
import HealthKit

/**
 A quantity sample type that measures the user’s weight.
 
 These samples use mass units (described in ``HKUnit``) and measure discrete values (described in ``HKQuantityAggregationStyle``).
 
 The default unit is kilograms.
 */
public struct BodyMass: HKDiscreteQuantity {

    public static let quantityTypeIdentifier: HKQuantityTypeIdentifier = .bodyMass

    /// Kg
    public static let defaultUnit: HKUnit = .gramUnit(with: .kilo)

    public let discreteQuantitySample: HKDiscreteQuantitySample

    public init(discreteQuantitySample: HKDiscreteQuantitySample) {
        self.discreteQuantitySample = discreteQuantitySample
    }
}

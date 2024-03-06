import Foundation
import HealthKit

/**
 A quantity sample type that measures the user’s lean body mass.
 
 These samples use mass units (described in ``HKUnit``) and measure discrete values (described in ``HKQuantityAggregationStyle``).

 The default unit is kilograms.
 */
public struct LeanBodyMass: HKDiscreteQuantity {

    public static let quantityTypeIdentifier: HKQuantityTypeIdentifier = .leanBodyMass

    /// Kg
    public static let defaultUnit: HKUnit = .gramUnit(with: .kilo)

    public let discreteQuantitySample: HKDiscreteQuantitySample

    public init(discreteQuantitySample: HKDiscreteQuantitySample) {
        self.discreteQuantitySample = discreteQuantitySample
    }
}

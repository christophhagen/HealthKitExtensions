import Foundation
import HealthKit

/**
 A quantity sample type that measures the user’s body temperature.

 These samples use temperature units (described in ``HKUnit``) and measure discrete values (described in ``HKQuantityAggregationStyle``).

 The default unit is °C.
 */
public struct BodyTemperature: HKDiscreteQuantity {

    public static let quantityTypeIdentifier: HKQuantityTypeIdentifier = .bodyTemperature

    /// °C
    public static let defaultUnit: HKUnit = .degreeCelsius()

    public let discreteQuantitySample: HKDiscreteQuantitySample

    public init(discreteQuantitySample: HKDiscreteQuantitySample) {
        self.discreteQuantitySample = discreteQuantitySample
    }
}

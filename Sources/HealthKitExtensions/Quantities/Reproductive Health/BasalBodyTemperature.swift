import Foundation
import HealthKit

/**
 A quantity sample type that records the user’s basal body temperature.

 Basal body temperature measures the body’s temperature when at rest (for example, taking the temperature immediately after waking). 
 These samples use temperature units (described in ``HKUnit``) and measure discrete values (described in ``HKQuantityAggregationStyle``).

 The default unit is °C.
 */
public struct BasalBodyTemperature: HKDiscreteQuantity {

    public static let quantityTypeIdentifier: HKQuantityTypeIdentifier = .basalBodyTemperature

    /// °C
    public static let defaultUnit: HKUnit = .degreeCelsius()

    public let discreteQuantitySample: HKDiscreteQuantitySample

    public init(discreteQuantitySample: HKDiscreteQuantitySample) {
        self.discreteQuantitySample = discreteQuantitySample
    }
}

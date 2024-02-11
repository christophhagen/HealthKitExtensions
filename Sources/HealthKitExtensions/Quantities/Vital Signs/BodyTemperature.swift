import Foundation
import HealthKit

public struct BodyTemperatureSpecification: HKQuantityTypeSpecification {

    public static let identifier: HKQuantityTypeIdentifier = .bodyTemperature

    /// °C
    public static let defaultUnit: HKUnit = .degreeCelsius()
}

/**
 A quantity sample type that measures the user’s body temperature.

 These samples use temperature units (described in ``HKUnit``) and measure discrete values (described in ``HKQuantityAggregationStyle``).

 The default unit is °C.
 */
public typealias BodyTemperature = HKDiscreteQuantityValue<BodyTemperatureSpecification>

import Foundation
import HealthKit

@available(iOS 16.0, watchOS 9.0, *)
public struct WaterTemperatureSpecification: HKQuantityTypeSpecification {

    public static let identifier: HKQuantityTypeIdentifier = .waterTemperature

    /// °C
    public static let defaultUnit: HKUnit = .degreeCelsius()
}

/**
 A quantity sample that records the water temperature.

 Apple Watch Ultra automatically records these samples during dive sessions.
 
 Water temperature samples use temperature units (described in ``HKUnit``) and measure discrete values (described in ``HKQuantityAggregationStyle``).

 The default unit is °C.
 */
@available(iOS 16.0, watchOS 9.0, *)
public typealias WaterTemperature = HKQuantityValue<WaterTemperatureSpecification>

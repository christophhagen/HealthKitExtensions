import Foundation
import HealthKit

public struct WaistCircumferenceSpecification: HKQuantityTypeSpecification {

    public static let identifier: HKQuantityTypeIdentifier = .waistCircumference

    /// microsiemens
    public static let defaultUnit: HKUnit = .meter()
}

/**
 A quantity sample type that measures the user’s waist circumference.
 
 These samples use length units (described in ``HKUnit``) and measure discrete values (described in ``HKQuantityAggregationStyle``).

 The default unit is meter.
 */
public typealias WaistCircumference = HKQuantityValue<WaistCircumferenceSpecification>

import Foundation
import HealthKit

public struct OxygenSaturationSpecification: HKQuantityTypeSpecification {

    public static let identifier: HKQuantityTypeIdentifier = .oxygenSaturation

    /// percent
    public static let defaultUnit: HKUnit = .percent()
}

/**
 A quantity sample type that measures the user’s oxygen saturation.

 Oxygen saturation samples measure the percentage of oxygen in the bloodstream. 
 These samples use percent units (described in ``HKUnit``) and measure discrete values (described in ``HKQuantityAggregationStyle``).

 The default unit is percent.
 */
public typealias OxygenSaturation = HKDiscreteQuantityValue<OxygenSaturationSpecification>

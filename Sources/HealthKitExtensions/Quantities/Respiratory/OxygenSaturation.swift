import Foundation
import HealthKit

/**
 A quantity sample type that measures the user’s oxygen saturation.

 Oxygen saturation samples measure the percentage of oxygen in the bloodstream. 
 These samples use percent units (described in ``HKUnit``) and measure discrete values (described in ``HKQuantityAggregationStyle``).

 The default unit is percent.
 */
public struct OxygenSaturation: HKDiscreteQuantity {

    public static let quantityTypeIdentifier: HKQuantityTypeIdentifier = .oxygenSaturation

    /// percent
    public static let defaultUnit: HKUnit = .percent()

    public let discreteQuantitySample: HKDiscreteQuantitySample

    public init(discreteQuantitySample: HKDiscreteQuantitySample) {
        self.discreteQuantitySample = discreteQuantitySample
    }
}

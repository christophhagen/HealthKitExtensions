import Foundation
import HealthKit

/**
 A quantity sample type that measures the user’s waist circumference.
 
 These samples use length units (described in ``HKUnit``) and measure discrete values (described in ``HKQuantityAggregationStyle``).

 The default unit is meter.
 */
public struct WaistCircumference: HKDiscreteQuantity {

    public static let quantityTypeIdentifier: HKQuantityTypeIdentifier = .waistCircumference

    /// meter
    public static let defaultUnit: HKUnit = .meter()

    public let discreteQuantitySample: HKDiscreteQuantitySample

    public init(discreteQuantitySample: HKDiscreteQuantitySample) {
        self.discreteQuantitySample = discreteQuantitySample
    }
}

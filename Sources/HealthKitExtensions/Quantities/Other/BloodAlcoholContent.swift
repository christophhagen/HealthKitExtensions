import Foundation
import HealthKit

/**
 A quantity sample type that measures the user’s blood alcohol content.

 These samples use percent units (described in ``HKUnit``) and measure discrete values (described in ``HKQuantityAggregationStyle``).

 The default unit is percent.
 */
public struct BloodAlcoholContent: HKDiscreteQuantity {

    public static let quantityTypeIdentifier: HKQuantityTypeIdentifier = .bloodAlcoholContent

    /// percent
    public static let defaultUnit: HKUnit = .percent()

    public let discreteQuantitySample: HKDiscreteQuantitySample

    public init(discreteQuantitySample: HKDiscreteQuantitySample) {
        self.discreteQuantitySample = discreteQuantitySample
    }
}

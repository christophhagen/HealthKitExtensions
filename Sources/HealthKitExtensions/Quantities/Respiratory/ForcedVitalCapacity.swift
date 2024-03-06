import Foundation
import HealthKit

/**
 A quantity sample type that measures the amount of air that can be forcibly exhaled from the lungs after taking the deepest breath possible.

 These samples use volume units (described in ``HKUnit``) and measure discrete values (described in ``HKQuantityAggregationStyle``).

 The default unit is liter.
 */
public struct ForcedVitalCapacity: HKDiscreteQuantity {

    public static let quantityTypeIdentifier: HKQuantityTypeIdentifier = .forcedVitalCapacity

    /// liter
    public static let defaultUnit: HKUnit = .liter()

    public let discreteQuantitySample: HKDiscreteQuantitySample

    public init(discreteQuantitySample: HKDiscreteQuantitySample) {
        self.discreteQuantitySample = discreteQuantitySample
    }
}

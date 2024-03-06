import Foundation
import HealthKit

/**
 A quantity sample type that measures the user’s height.
 
 These samples use length units (described in ``HKUnit``) and measure discrete values (described in ``HKQuantityAggregationStyle``).

 The default unit is meter.
 */
public struct Height: HKDiscreteQuantity {

    public static let quantityTypeIdentifier: HKQuantityTypeIdentifier = .height

    /// meter
    public static let defaultUnit: HKUnit = .meter()

    public let discreteQuantitySample: HKDiscreteQuantitySample

    public init(discreteQuantitySample: HKDiscreteQuantitySample) {
        self.discreteQuantitySample = discreteQuantitySample
    }
}

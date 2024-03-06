import Foundation
import HealthKit

/**
 A quantity sample type that measures the user’s exposure to UV radiation.

 These samples use count units (described in ``HKUnit``) and measure discrete values (described in ``HKQuantityAggregationStyle``).
 The sample’s value represents the UV index that the user was exposed to during the sample’s duration.

 The default unit is count.
 */
public struct UvExposure: HKDiscreteQuantity {

    public static let quantityTypeIdentifier: HKQuantityTypeIdentifier = .uvExposure

    /// count
    public static let defaultUnit: HKUnit = .count()

    public let discreteQuantitySample: HKDiscreteQuantitySample

    public init(discreteQuantitySample: HKDiscreteQuantitySample) {
        self.discreteQuantitySample = discreteQuantitySample
    }
}

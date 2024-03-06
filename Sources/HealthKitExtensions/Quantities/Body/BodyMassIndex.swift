import Foundation
import HealthKit

/**
 A quantity sample type that measures the user’s body mass index.
 
 These samples use count units (described in ``HKUnit``) and measure discrete values (described in ``HKQuantityAggregationStyle``).

 The default unit is counts.
 */
public struct BodyMassIndex: HKDiscreteQuantity {

    public static let quantityTypeIdentifier: HKQuantityTypeIdentifier = .bodyMassIndex

    /// Count
    public static let defaultUnit: HKUnit = .count()

    public let discreteQuantitySample: HKDiscreteQuantitySample

    public init(discreteQuantitySample: HKDiscreteQuantitySample) {
        self.discreteQuantitySample = discreteQuantitySample
    }
}

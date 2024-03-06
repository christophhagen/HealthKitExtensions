import Foundation
import HealthKit

/**
 A quantity sample type that measures the user’s body fat percentage.
 
 These samples use percent units (described in ``HKUnit``) and measure discrete values (described in ``HKQuantityAggregationStyle``).
 
 The default unit is percent.
 */
public struct BodyFatPercentage: HKDiscreteQuantity {

    public static let quantityTypeIdentifier: HKQuantityTypeIdentifier = .bodyFatPercentage

    public static let defaultUnit: HKUnit = .percent()

    public let discreteQuantitySample: HKDiscreteQuantitySample

    public init(discreteQuantitySample: HKDiscreteQuantitySample) {
        self.discreteQuantitySample = discreteQuantitySample
    }
}

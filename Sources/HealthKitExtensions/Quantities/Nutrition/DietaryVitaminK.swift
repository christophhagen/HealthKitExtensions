import Foundation
import HealthKit

/**
 A quantity sample type that measures the amount of vitamin K consumed.

 These samples use mass units (described in ``HKUnit``) and measure cumulative values (described in ``HKQuantityAggregationStyle``).

 The default unit is gram.
 */
public struct DietaryVitaminK: HKDietaryQuantity {

    public static let quantityTypeIdentifier: HKQuantityTypeIdentifier = .dietaryVitaminK

    /// gram
    public static let defaultUnit: HKUnit = .gram()

    public let cumulativeQuantitySample: HKCumulativeQuantitySample

    public init(cumulativeQuantitySample: HKCumulativeQuantitySample) {
        self.cumulativeQuantitySample = cumulativeQuantitySample
    }
}


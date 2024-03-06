import Foundation
import HealthKit

/**
 A quantity sample type that measures the amount of cyanocobalamin (vitamin B12) consumed.

 These samples use mass units (described in ``HKUnit``) and measure cumulative values (described in ``HKQuantityAggregationStyle``).

 The default unit is gram.
 */
public struct DietaryVitaminB12: HKDietaryQuantity {

    public static let quantityTypeIdentifier: HKQuantityTypeIdentifier = .dietaryVitaminB12

    /// gram
    public static let defaultUnit: HKUnit = .gram()

    public let cumulativeQuantitySample: HKCumulativeQuantitySample

    public init(cumulativeQuantitySample: HKCumulativeQuantitySample) {
        self.cumulativeQuantitySample = cumulativeQuantitySample
    }
}


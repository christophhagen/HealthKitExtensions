import Foundation
import HealthKit

/**
 A quantity sample type that measures the amount of pyridoxine (vitamin B6) consumed.

 These samples use mass units (described in ``HKUnit``) and measure cumulative values (described in ``HKQuantityAggregationStyle``).

 The default unit is gram.
 */
public struct DietaryVitaminB6: HKDietaryQuantity {

    public static let quantityTypeIdentifier: HKQuantityTypeIdentifier = .dietaryVitaminB6

    /// gram
    public static let defaultUnit: HKUnit = .gram()

    public let cumulativeQuantitySample: HKCumulativeQuantitySample

    public init(cumulativeQuantitySample: HKCumulativeQuantitySample) {
        self.cumulativeQuantitySample = cumulativeQuantitySample
    }
}


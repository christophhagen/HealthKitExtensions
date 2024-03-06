import Foundation
import HealthKit

/**
 A quantity sample type that measures the amount of niacin (vitamin B3) consumed.

 These samples use mass units (described in ``HKUnit``) and measure cumulative values (described in ``HKQuantityAggregationStyle``).

 The default unit is gram.
 */
public struct DietaryNiacin: HKDietaryQuantity {

    public static let quantityTypeIdentifier: HKQuantityTypeIdentifier = .dietaryNiacin

    /// gram
    public static let defaultUnit: HKUnit = .gram()

    public let cumulativeQuantitySample: HKCumulativeQuantitySample

    public init(cumulativeQuantitySample: HKCumulativeQuantitySample) {
        self.cumulativeQuantitySample = cumulativeQuantitySample
    }
}


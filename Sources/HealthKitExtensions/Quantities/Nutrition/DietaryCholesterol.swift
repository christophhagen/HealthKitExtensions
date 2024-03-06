import Foundation
import HealthKit

/**
 A quantity sample type that measures the amount of Cholesterol consumed.

 These samples use mass units (described in ``HKUnit``) and measure cumulative values (described in ``HKQuantityAggregationStyle``).

 The default unit is gram.
 */
public struct DietaryCholesterol: HKDietaryQuantity {

    public static let quantityTypeIdentifier: HKQuantityTypeIdentifier = .dietaryCholesterol

    /// gram
    public static let defaultUnit: HKUnit = .gram()

    public let cumulativeQuantitySample: HKCumulativeQuantitySample

    public init(cumulativeQuantitySample: HKCumulativeQuantitySample) {
        self.cumulativeQuantitySample = cumulativeQuantitySample
    }
}


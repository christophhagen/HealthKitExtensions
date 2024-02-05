import Foundation
import HealthKit

public struct DietaryCarbohydratesSpecification: HKQuantityTypeSpecification {

    public static let identifier: HKQuantityTypeIdentifier = .dietaryCarbohydrates

    /// gram
    public static let defaultUnit: HKUnit = .gram()
}

/**
 A quantity sample type that measures the amount of carbohydrates consumed.

 These samples use mass units (described in ``HKUnit``) and measure cumulative values (described in ``HKQuantityAggregationStyle``).

 The default unit is gram.
 */
public typealias DietaryCarbohydrates = HKDietaryQuantityValue<DietaryCarbohydratesSpecification>

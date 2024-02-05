import Foundation
import HealthKit

public struct DietaryVitaminB12Specification: HKQuantityTypeSpecification {

    public static let identifier: HKQuantityTypeIdentifier = .dietaryVitaminB12

    /// gram
    public static let defaultUnit: HKUnit = .gram()
}

/**
 A quantity sample type that measures the amount of cyanocobalamin (vitamin B12) consumed.

 These samples use mass units (described in ``HKUnit``) and measure cumulative values (described in ``HKQuantityAggregationStyle``).

 The default unit is gram.
 */
public typealias DietaryVitaminB12 = HKDietaryQuantityValue<DietaryVitaminB12Specification>

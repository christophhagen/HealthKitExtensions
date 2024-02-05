import Foundation
import HealthKit

public struct DietaryVitaminB6Specification: HKQuantityTypeSpecification {

    public static let identifier: HKQuantityTypeIdentifier = .dietaryVitaminB6

    /// gram
    public static let defaultUnit: HKUnit = .gram()
}

/**
 A quantity sample type that measures the amount of pyridoxine (vitamin B6) consumed.

 These samples use mass units (described in ``HKUnit``) and measure cumulative values (described in ``HKQuantityAggregationStyle``).

 The default unit is gram.
 */
public typealias DietaryVitaminB6 = HKDietaryQuantityValue<DietaryVitaminB6Specification>

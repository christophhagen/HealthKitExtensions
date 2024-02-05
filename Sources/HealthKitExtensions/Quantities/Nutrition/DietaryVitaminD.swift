import Foundation
import HealthKit

public struct DietaryVitaminDSpecification: HKQuantityTypeSpecification {

    public static let identifier: HKQuantityTypeIdentifier = .dietaryVitaminD

    /// gram
    public static let defaultUnit: HKUnit = .gram()
}

/**
 A quantity sample type that measures the amount of vitamin D consumed.

 These samples use mass units (described in ``HKUnit``) and measure cumulative values (described in ``HKQuantityAggregationStyle``).

 The default unit is gram.
 */
public typealias DietaryVitaminD = HKDietaryQuantityValue<DietaryVitaminDSpecification>

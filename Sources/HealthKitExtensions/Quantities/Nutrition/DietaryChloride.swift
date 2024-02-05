import Foundation
import HealthKit

public struct DietaryChlorideSpecification: HKQuantityTypeSpecification {

    public static let identifier: HKQuantityTypeIdentifier = .dietaryChloride

    /// gram
    public static let defaultUnit: HKUnit = .gram()
}

/**
 A quantity sample type that measures the amount of chloride consumed.

 These samples use mass units (described in ``HKUnit``) and measure cumulative values (described in ``HKQuantityAggregationStyle``).

 The default unit is gram.
 */
public typealias DietaryChloride = HKDietaryQuantityValue<DietaryChlorideSpecification>

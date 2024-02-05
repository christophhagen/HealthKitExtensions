import Foundation
import HealthKit

public struct DietaryFatSaturatedSpecification: HKQuantityTypeSpecification {

    public static let identifier: HKQuantityTypeIdentifier = .dietaryFatSaturated

    /// gram
    public static let defaultUnit: HKUnit = .gram()
}

/**
 A quantity sample type that measures the amount of saturated fat consumed.

 These samples use mass units (described in ``HKUnit``) and measure cumulative values (described in ``HKQuantityAggregationStyle``).

 The default unit is gram.
 */
public typealias DietaryFatSaturated = HKDietaryQuantityValue<DietaryFatSaturatedSpecification>

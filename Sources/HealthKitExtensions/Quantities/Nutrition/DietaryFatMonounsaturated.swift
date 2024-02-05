import Foundation
import HealthKit

public struct DietaryFatMonounsaturatedSpecification: HKQuantityTypeSpecification {

    public static let identifier: HKQuantityTypeIdentifier = .dietaryFatMonounsaturated

    /// gram
    public static let defaultUnit: HKUnit = .gram()
}

/**
 A quantity sample type that measures the amount of monounsaturated fat consumed.

 These samples use mass units (described in ``HKUnit``) and measure cumulative values (described in ``HKQuantityAggregationStyle``).

 The default unit is gram.
 */
public typealias DietaryFatMonounsaturated = HKDietaryQuantityValue<DietaryFatMonounsaturatedSpecification>

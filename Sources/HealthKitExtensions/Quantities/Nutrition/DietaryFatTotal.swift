import Foundation
import HealthKit

public struct DietaryFatTotalSpecification: HKQuantityTypeSpecification {

    public static let identifier: HKQuantityTypeIdentifier = .dietaryFatTotal

    /// gram
    public static let defaultUnit: HKUnit = .gram()
}

/**
 A quantity sample type that measures the total amount of fat consumed.

 These samples include polyunsaturated, monounsaturated, and saturated fats.
 These samples use mass units (described in ``HKUnit``) and measure cumulative values (described in ``HKQuantityAggregationStyle``).

 The default unit is gram.
 */
public typealias DietaryFatTotal = HKDietaryQuantityValue<DietaryFatTotalSpecification>

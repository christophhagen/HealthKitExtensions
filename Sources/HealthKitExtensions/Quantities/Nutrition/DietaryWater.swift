import Foundation
import HealthKit

public struct DietaryWaterSpecification: HKQuantityTypeSpecification {

    public static let identifier: HKQuantityTypeIdentifier = .dietaryWater

    /// liter
    public static let defaultUnit: HKUnit = .liter()
}

/**
 A quantity sample type that measures the amount of water consumed.

 These samples use volume units (described in ``HKUnit``) and measure cumulative values (described in ``HKQuantityAggregationStyle``).

 The default unit is liter.
 */
public typealias DietaryWater = HKDietaryQuantityValue<DietaryWaterSpecification>

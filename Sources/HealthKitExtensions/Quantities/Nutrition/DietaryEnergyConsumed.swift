import Foundation
import HealthKit

public struct DietaryEnergyConsumedSpecification: HKQuantityTypeSpecification {

    public static let identifier: HKQuantityTypeIdentifier = .dietaryEnergyConsumed

    /// Cal
    public static let defaultUnit: HKUnit = .largeCalorie()
}

/**
 A quantity sample type that measures the amount of energy consumed.

 These samples use energy units (described in ``HKUnit``) and measure cumulative values (described in ``HKQuantityAggregationStyle``).

 The default unit is Cal.
 */
public typealias DietaryEnergyConsumed = HKDietaryQuantityValue<DietaryEnergyConsumedSpecification>

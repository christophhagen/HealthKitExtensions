import Foundation
import HealthKit

/**
 A quantity sample type that measures the amount of energy consumed.

 These samples use energy units (described in ``HKUnit``) and measure cumulative values (described in ``HKQuantityAggregationStyle``).

 The default unit is Cal.
 */
public struct DietaryEnergyConsumed: HKDietaryQuantity {

    public static let quantityTypeIdentifier: HKQuantityTypeIdentifier = .dietaryEnergyConsumed

    /// kcal
    public static let defaultUnit: HKUnit = .kilocalorie()

    public let cumulativeQuantitySample: HKCumulativeQuantitySample

    public init(cumulativeQuantitySample: HKCumulativeQuantitySample) {
        self.cumulativeQuantitySample = cumulativeQuantitySample
    }
}


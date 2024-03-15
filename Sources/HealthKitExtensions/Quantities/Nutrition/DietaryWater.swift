import Foundation
import HealthKit

/**
 A quantity sample type that measures the amount of water consumed.

 These samples use volume units (described in ``HKUnit``) and measure cumulative values (described in ``HKQuantityAggregationStyle``).

 The default unit is liter.
 */
public struct DietaryWater: HKDietaryQuantity {

    public static let quantityTypeIdentifier: HKQuantityTypeIdentifier = .dietaryWater

    /// mL
    public static let defaultUnit: HKUnit = .literUnit(with: .milli)

    public let cumulativeQuantitySample: HKCumulativeQuantitySample

    public init(cumulativeQuantitySample: HKCumulativeQuantitySample) {
        self.cumulativeQuantitySample = cumulativeQuantitySample
    }
}


import Foundation
import HealthKit

public struct DietaryPantothenicAcidSpecification: HKQuantityTypeSpecification {

    public static let identifier: HKQuantityTypeIdentifier = .dietaryPantothenicAcid

    /// gram
    public static let defaultUnit: HKUnit = .gram()
}

/**
 A quantity sample type that measures the amount of pantothenic acid (vitamin B5) consumed.

 These samples use mass units (described in ``HKUnit``) and measure cumulative values (described in ``HKQuantityAggregationStyle``).

 The default unit is gram.
 */
public typealias DietaryPantothenicAcid = HKDietaryQuantityValue<DietaryPantothenicAcidSpecification>

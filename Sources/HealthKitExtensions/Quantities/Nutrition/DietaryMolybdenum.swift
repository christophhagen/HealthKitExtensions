import Foundation
import HealthKit

public struct DietaryMolybdenumSpecification: HKQuantityTypeSpecification {

    public static let identifier: HKQuantityTypeIdentifier = .dietaryMolybdenum

    /// gram
    public static let defaultUnit: HKUnit = .gram()
}

/**
 A quantity sample type that measures the amount of Molybdenum consumed.

 These samples use mass units (described in ``HKUnit``) and measure cumulative values (described in ``HKQuantityAggregationStyle``).

 The default unit is gram.
 */
public typealias DietaryMolybdenum = HKDietaryQuantityValue<DietaryMolybdenumSpecification>

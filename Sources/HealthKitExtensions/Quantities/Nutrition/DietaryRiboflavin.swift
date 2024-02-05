import Foundation
import HealthKit

public struct DietaryRiboflavinSpecification: HKQuantityTypeSpecification {

    public static let identifier: HKQuantityTypeIdentifier = .dietaryRiboflavin

    /// gram
    public static let defaultUnit: HKUnit = .gram()
}

/**
 A quantity sample type that measures the amount of riboflavin (vitamin B2) consumed.

 These samples use mass units (described in ``HKUnit``) and measure cumulative values (described in ``HKQuantityAggregationStyle``).

 The default unit is gram.
 */
public typealias DietaryRiboflavin = HKDietaryQuantityValue<DietaryRiboflavinSpecification>

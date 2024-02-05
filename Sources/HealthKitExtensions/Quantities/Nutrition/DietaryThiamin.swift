import Foundation
import HealthKit

public struct DietaryThiaminSpecification: HKQuantityTypeSpecification {

    public static let identifier: HKQuantityTypeIdentifier = .dietaryThiamin

    /// gram
    public static let defaultUnit: HKUnit = .gram()
}

/**
 A quantity sample type that measures the amount of thiamin (vitamin B1) consumed.

 These samples use mass units (described in ``HKUnit``) and measure cumulative values (described in ``HKQuantityAggregationStyle``).

 The default unit is gram.
 */
public typealias DietaryThiamin = HKDietaryQuantityValue<DietaryThiaminSpecification>

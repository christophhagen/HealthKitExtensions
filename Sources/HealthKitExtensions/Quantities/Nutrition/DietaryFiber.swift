import Foundation
import HealthKit

public struct DietaryFiberSpecification: HKQuantityTypeSpecification {

    public static let identifier: HKQuantityTypeIdentifier = .dietaryFiber

    /// gram
    public static let defaultUnit: HKUnit = .gram()
}

/**
 A quantity sample type that measures the amount of Fiber consumed.

 These samples use mass units (described in ``HKUnit``) and measure cumulative values (described in ``HKQuantityAggregationStyle``).

 The default unit is gram.
 */
public typealias DietaryFiber = HKDietaryQuantityValue<DietaryFiberSpecification>

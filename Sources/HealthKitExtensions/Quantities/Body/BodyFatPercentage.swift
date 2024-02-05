import Foundation
import HealthKit

public struct BodyFatPercentageSpecification: HKQuantityTypeSpecification {

    public static let identifier: HKQuantityTypeIdentifier = .bodyFatPercentage

    /// Percent
    public static let defaultUnit: HKUnit = .percent()
}

/**
 A quantity sample type that measures the user’s body fat percentage.
 
 These samples use percent units (described in ``HKUnit``) and measure discrete values (described in ``HKQuantityAggregationStyle``).
 
 The default unit is percent.
 */
public typealias BodyFatPercentage = HKQuantityValue<BodyFatPercentageSpecification>

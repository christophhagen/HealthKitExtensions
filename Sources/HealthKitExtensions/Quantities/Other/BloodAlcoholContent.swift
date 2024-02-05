import Foundation
import HealthKit

public struct BloodAlcoholContentSpecification: HKQuantityTypeSpecification {

    public static let identifier: HKQuantityTypeIdentifier = .bloodAlcoholContent

    /// percent
    public static let defaultUnit: HKUnit = .percent()
}

/**
 A quantity sample type that measures the user’s blood alcohol content.

 These samples use percent units (described in ``HKUnit``) and measure discrete values (described in ``HKQuantityAggregationStyle``).

 The default unit is percent.
 */
public typealias BloodAlcoholContent = HKQuantityValue<BloodAlcoholContentSpecification>

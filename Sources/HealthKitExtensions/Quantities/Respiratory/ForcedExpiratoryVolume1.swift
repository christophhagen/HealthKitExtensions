import Foundation
import HealthKit

public struct ForcedExpiratoryVolume1Specification: HKQuantityTypeSpecification {

    public static let identifier: HKQuantityTypeIdentifier = .forcedExpiratoryVolume1

    /// liter
    public static let defaultUnit: HKUnit = .liter()
}

/**
 A quantity sample type that measures the amount of air that can be forcibly exhaled from the lungs during the first second of a forced exhalation.

 These samples use volume units (described in ``HKUnit``) and measure discrete values (described in ``HKQuantityAggregationStyle``).

 The default unit is liter.
 */
public typealias ForcedExpiratoryVolume1 = HKDiscreteQuantityValue<ForcedExpiratoryVolume1Specification>

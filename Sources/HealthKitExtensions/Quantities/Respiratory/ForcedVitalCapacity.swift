import Foundation
import HealthKit

public struct ForcedVitalCapacitySpecification: HKQuantityTypeSpecification {

    public static let identifier: HKQuantityTypeIdentifier = .forcedVitalCapacity

    /// liter
    public static let defaultUnit: HKUnit = .liter()
}

/**
 A quantity sample type that measures the amount of air that can be forcibly exhaled from the lungs after taking the deepest breath possible.

 These samples use volume units (described in ``HKUnit``) and measure discrete values (described in ``HKQuantityAggregationStyle``).

 The default unit is liter.
 */
public typealias ForcedVitalCapacity = HKDiscreteQuantityValue<ForcedVitalCapacitySpecification>

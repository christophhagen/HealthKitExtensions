import Foundation
import HealthKit

public struct NikeFuelSpecification: HKQuantityTypeSpecification {

    public static let identifier: HKQuantityTypeIdentifier = .nikeFuel

    /// count
    public static let defaultUnit: HKUnit = .count()
}

/**
 A quantity sample type that measures the number of NikeFuel points the user has earned.

 These samples use count units (described in ``HKUnit``) and measure cumulative values (described in ``HKQuantityAggregationStyle``).

 The default unit is count.
 */
public typealias NikeFuel = HKQuantityValue<NikeFuelSpecification>

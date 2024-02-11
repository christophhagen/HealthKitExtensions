import Foundation
import HealthKit

public struct InhalerUsageSpecification: HKQuantityTypeSpecification {

    public static let identifier: HKQuantityTypeIdentifier = .inhalerUsage

    /// count
    public static let defaultUnit: HKUnit = .count()
}

/**
 A quantity sample type that measures the number of puffs the user takes from their inhaler.

 These samples use count units (described in ``HKUnit``) and measure cumulative values (described in ``HKQuantityAggregationStyle``).

 The default unit is count.
 */
public typealias InhalerUsage = HKCumulativeQuantityValue<InhalerUsageSpecification>

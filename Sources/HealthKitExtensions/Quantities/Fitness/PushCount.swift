import Foundation
import HealthKit

public struct PushCountSpecification: HKQuantityTypeSpecification {

    public static let identifier: HKQuantityTypeIdentifier = .pushCount

    /// count
    public static let defaultUnit: HKUnit = .count()
}

/**
 A quantity sample type that measures the number of pushes that the user has performed while using a wheelchair.

 These samples use count units (described in ``HKUnit``) and measure cumulative values (described in ``HKQuantityAggregationStyle``).

 The default unit is count.
 */
public typealias PushCount = HKCumulativeQuantityValue<PushCountSpecification>

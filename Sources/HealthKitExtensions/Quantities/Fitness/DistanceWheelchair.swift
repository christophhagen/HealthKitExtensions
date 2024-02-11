import Foundation
import HealthKit

public struct DistanceWheelchairSpecification: HKQuantityTypeSpecification {

    public static let identifier: HKQuantityTypeIdentifier = .distanceWheelchair

    /// meter
    public static let defaultUnit: HKUnit = .meter()
}

/**
 A quantity sample type that measures the distance the user has moved using a wheelchair.

 These samples use length units (described in ``HKUnit``) and measure cumulative values (described in ``HKQuantityAggregationStyle``).

 The default unit is meter.
 */
public typealias DistanceWheelchair = HKCumulativeQuantityValue<DistanceWheelchairSpecification>

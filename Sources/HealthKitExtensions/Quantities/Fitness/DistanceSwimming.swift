import Foundation
import HealthKit

public struct DistanceSwimmingSpecification: HKQuantityTypeSpecification {

    public static let identifier: HKQuantityTypeIdentifier = .distanceSwimming

    /// meter
    public static let defaultUnit: HKUnit = .meter()
}

/**
 A quantity sample type that measures the distance the user has moved while swimming.

 These samples use length units (described in ``HKUnit``) and measure cumulative values (described in ``HKQuantityAggregationStyle``).

 The default unit is meter.
 */
public typealias DistanceSwimming = HKCumulativeQuantityValue<DistanceSwimmingSpecification>

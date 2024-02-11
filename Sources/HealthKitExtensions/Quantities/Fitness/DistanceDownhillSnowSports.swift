import Foundation
import HealthKit

public struct DistanceDownhillSnowSportsSpecification: HKQuantityTypeSpecification {

    public static let identifier: HKQuantityTypeIdentifier = .distanceDownhillSnowSports

    /// meter
    public static let defaultUnit: HKUnit = .meter()
}

/**
 A quantity sample type that measures the distance the user has traveled while skiing or snowboarding.

 These samples use length units (described in ``HKUnit``) and measure cumulative values (described in ``HKQuantityAggregationStyle``).

 The default unit is meter.
 */
public typealias DistanceDownhillSnowSports = HKCumulativeQuantityValue<DistanceDownhillSnowSportsSpecification>

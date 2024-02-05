import Foundation
import HealthKit

public struct DistanceWalkingRunningSpecification: HKQuantityTypeSpecification {

    public static let identifier: HKQuantityTypeIdentifier = .distanceWalkingRunning

    /// meter
    public static let defaultUnit: HKUnit = .meter()
}

/**
 A quantity sample type that measures the distance the user has moved by walking or running.

 These samples use length units (described in ``HKUnit``) and measure cumulative values (described in ``HKQuantityAggregationStyle``).

 The default unit is meter.
 */
public typealias DistanceWalkingRunning = HKQuantityValue<DistanceWalkingRunningSpecification>

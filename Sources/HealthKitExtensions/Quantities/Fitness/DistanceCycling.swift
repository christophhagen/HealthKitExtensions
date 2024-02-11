import Foundation
import HealthKit

public struct DistanceCyclingSpecification: HKQuantityTypeSpecification {

    public static let identifier: HKQuantityTypeIdentifier = .distanceCycling

    /// meter
    public static let defaultUnit: HKUnit = .meter()
}

/**
 A quantity sample type that measures the distance the user has moved by cycling.
 
 These samples use length units (described in ``HKUnit``) and measure cumulative values (described in ``HKQuantityAggregationStyle``).

 The default unit is meter.
 */
public typealias DistanceCycling = HKCumulativeQuantityValue<DistanceCyclingSpecification>

import Foundation
import HealthKit

public struct FlightsClimbedSpecification: HKQuantityTypeSpecification {

    public static let identifier: HKQuantityTypeIdentifier = .flightsClimbed

    /// count
    public static let defaultUnit: HKUnit = .count()
}

/**
 A quantity sample type that measures the number flights of stairs that the user has climbed.

 These samples use count units (described in ``HKUnit``) and measure cumulative values (described in ``HKQuantityAggregationStyle``).

 The default unit is count.
 */
public typealias FlightsClimbed = HKCumulativeQuantityValue<FlightsClimbedSpecification>

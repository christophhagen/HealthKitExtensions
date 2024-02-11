import Foundation
import HealthKit

public struct PeakExpiratoryFlowRateSpecification: HKQuantityTypeSpecification {

    public static let identifier: HKQuantityTypeIdentifier = .peakExpiratoryFlowRate

    /// L/min
    public static let defaultUnit: HKUnit = .liter().unitDivided(by: .minute())
}

/**
 A quantity sample type that measures the user’s maximum flow rate generated during a forceful exhalation.

 These samples use volume/time units (described in ``HKUnit``) and measure discrete values (described in ``HKQuantityAggregationStyle``).

 The default unit is L/min.
 */
public typealias PeakExpiratoryFlowRate = HKDiscreteQuantityValue<PeakExpiratoryFlowRateSpecification>

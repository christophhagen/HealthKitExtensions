import Foundation
import HealthKit

public struct HeartRateVariabilitySDNNSpecification: HKQuantityTypeSpecification {

    public static let identifier: HKQuantityTypeIdentifier = .heartRateVariabilitySDNN

    /// second
    public static let defaultUnit: HKUnit = .second()
}

/**
 A quantity sample type that measures the standard deviation of heartbeat intervals.
 
 These samples use time units (described in ``HKUnit``) and measure discrete values (described in ``HKQuantityAggregationStyle``).
 HealthKit calculates the Heart rate variability (HRV) by measuring the variation between individual heartbeats. 
 While there are multiple ways of computing HRV, HealthKit uses SDNN heart rate variability, which uses the standard deviation of the inter-beat (RR) intervals between normal heartbeats (typically measured in milliseconds).

 The default unit is seconds.
 */
public typealias HeartRateVariabilitySDNN = HKQuantityValue<HeartRateVariabilitySDNNSpecification>

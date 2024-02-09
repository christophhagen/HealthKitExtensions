import Foundation
import HealthKit

@available(iOS 16.0, watchOS 9.0, *)
public struct HeartRateRecoveryOneMinuteSpecification: HKQuantityTypeSpecification {

    public static let identifier: HKQuantityTypeIdentifier = .heartRateRecoveryOneMinute

    /// counts per second
    public static let defaultUnit: HKUnit = .count()
}

/**
 A quantity sample that records the reduction in heart rate from the peak exercise rate to the rate one minute after exercising ended.
 
 Heart rate recovery samples use count units (described in ``HKUnit``) and measure discrete values (described in ``HKQuantityAggregationStyle``).
 These samples always record a positive value.

 The default unit is counts.
 */
@available(iOS 16.0, watchOS 9.0, *)
public typealias HeartRateRecoveryOneMinute = HKQuantityValue<HeartRateRecoveryOneMinuteSpecification>
import Foundation
import HealthKit

/**
 A quantity sample that records the reduction in heart rate from the peak exercise rate to the rate one minute after exercising ended.
 
 Heart rate recovery samples use count units (described in ``HKUnit``) and measure discrete values (described in ``HKQuantityAggregationStyle``).
 These samples always record a positive value.

 The default unit is counts/minute.
 */
@available(iOS 16.0, watchOS 9.0, *)
public struct HeartRateRecoveryOneMinute: HKDiscreteQuantity {

    public static let quantityTypeIdentifier: HKQuantityTypeIdentifier = .heartRateRecoveryOneMinute

    /// counts per minute
    public static let defaultUnit: HKUnit = .count().unitDivided(by: .minute())

    public let discreteQuantitySample: HKDiscreteQuantitySample

    public init(discreteQuantitySample: HKDiscreteQuantitySample) {
        self.discreteQuantitySample = discreteQuantitySample
    }
}

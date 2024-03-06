import Foundation
import HealthKit

/**
 A quantity sample type that measures the cycling cadence by the user.

 The default unit is revolutions per minute.
 */
@available(iOS 17.0, macOS 14.0, watchOS 10.0, *)
public struct CyclingCadence: HKDiscreteQuantity {

    public static let quantityTypeIdentifier: HKQuantityTypeIdentifier = .cyclingCadence

    /// revolutions per minute
    public static let defaultUnit: HKUnit = .count().unitDivided(by: .minute())

    public let discreteQuantitySample: HKDiscreteQuantitySample

    public init(discreteQuantitySample: HKDiscreteQuantitySample) {
        self.discreteQuantitySample = discreteQuantitySample
    }
}

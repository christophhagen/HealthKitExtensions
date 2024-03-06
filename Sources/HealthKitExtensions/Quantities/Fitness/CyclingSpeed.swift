import Foundation
import HealthKit

/**
 The default unit is meter per second.
 */
@available(iOS 17.0, macOS 14.0, watchOS 10.0, *)
public struct CyclingSpeed: HKDiscreteQuantity {

    public static let quantityTypeIdentifier: HKQuantityTypeIdentifier = .cyclingSpeed

    /// m/s
    public static let defaultUnit: HKUnit = .meter().unitDivided(by: .second())

    public let discreteQuantitySample: HKDiscreteQuantitySample

    public init(discreteQuantitySample: HKDiscreteQuantitySample) {
        self.discreteQuantitySample = discreteQuantitySample
    }
}

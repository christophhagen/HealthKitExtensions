import Foundation
import HealthKit

/**
 The default unit is Watt.
 */
@available(iOS 17.0, macOS 14.0, watchOS 10.0, *)
public struct CyclingPower: HKDiscreteQuantity {

    public static let quantityTypeIdentifier: HKQuantityTypeIdentifier = .cyclingPower

    /// watt
    public static let defaultUnit: HKUnit = .watt()

    public let discreteQuantitySample: HKDiscreteQuantitySample

    public init(discreteQuantitySample: HKDiscreteQuantitySample) {
        self.discreteQuantitySample = discreteQuantitySample
    }
}

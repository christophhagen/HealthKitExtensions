import Foundation
import HealthKit

/**
 The default unit is dBASPL (see``decibelAWeightedSoundPressureLevel()``).
 */
@available(iOS 16.0, watchOS 9.0, *)
public struct EnvironmentalSoundReduction: HKDiscreteQuantity {

    public static let quantityTypeIdentifier: HKQuantityTypeIdentifier = .environmentalSoundReduction

    /// dBASPL
    public static let defaultUnit: HKUnit = .decibelAWeightedSoundPressureLevel()

    public let discreteQuantitySample: HKDiscreteQuantitySample

    public init(discreteQuantitySample: HKDiscreteQuantitySample) {
        self.discreteQuantitySample = discreteQuantitySample
    }
}

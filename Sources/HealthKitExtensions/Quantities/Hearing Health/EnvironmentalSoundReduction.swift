import Foundation
import HealthKit

@available(iOS 16.0, watchOS 9.0, *)
public struct EnvironmentalSoundReductionSpecification: HKQuantityTypeSpecification {

    public static let identifier: HKQuantityTypeIdentifier = .environmentalSoundReduction

    /// joule
    public static let defaultUnit: HKUnit = .decibelAWeightedSoundPressureLevel()
}

/**
 The default unit is dBASPL (see``decibelAWeightedSoundPressureLevel()``).
 */
@available(iOS 16.0, watchOS 9.0, *)
public typealias EnvironmentalSoundReduction = HKQuantityValue<EnvironmentalSoundReductionSpecification>

import Foundation
import HealthKit

public struct EnvironmentalAudioExposureSpecification: HKQuantityTypeSpecification {

    public static let identifier: HKQuantityTypeIdentifier = .environmentalAudioExposure

    /// joule
    public static let defaultUnit: HKUnit = .decibelAWeightedSoundPressureLevel()
}

/**
 A quantity sample type that measures audio exposure to sounds in the environment.

 These samples use sound pressure units (described in ``HKUnit``).
 You create these units using the ``decibelAWeightedSoundPressureLevel()`` method.
 They measure discrete values of the equivalent continuous sound pressure level, described in ``HKQuantityAggregationStyle.discreteEquivalentContinuousLevel``.

 The default unit is dBASPL (see``decibelAWeightedSoundPressureLevel()``).
 */
public typealias EnvironmentalAudioExposure = HKQuantityValue<EnvironmentalAudioExposureSpecification>

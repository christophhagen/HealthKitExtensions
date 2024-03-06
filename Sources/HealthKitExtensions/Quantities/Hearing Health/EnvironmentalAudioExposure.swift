import Foundation
import HealthKit

/**
 A quantity sample type that measures audio exposure to sounds in the environment.

 These samples use sound pressure units (described in ``HKUnit``).
 You create these units using the ``decibelAWeightedSoundPressureLevel()`` method.
 They measure discrete values of the equivalent continuous sound pressure level, described in ``HKQuantityAggregationStyle.discreteEquivalentContinuousLevel``.

 The default unit is dBASPL (see``decibelAWeightedSoundPressureLevel()``).
 */
public struct EnvironmentalAudioExposure: HKDiscreteQuantity {

    public static let quantityTypeIdentifier: HKQuantityTypeIdentifier = .environmentalAudioExposure

    /// dBASPL
    public static let defaultUnit: HKUnit = .decibelAWeightedSoundPressureLevel()

    public let discreteQuantitySample: HKDiscreteQuantitySample

    public init(discreteQuantitySample: HKDiscreteQuantitySample) {
        self.discreteQuantitySample = discreteQuantitySample
    }
}

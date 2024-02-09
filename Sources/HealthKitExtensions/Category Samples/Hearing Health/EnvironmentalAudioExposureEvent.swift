import Foundation
import HealthKit

extension HKCategoryValueEnvironmentalAudioExposureEvent: HKCategoryTypeIdentifierProvider {
    public static let identifier: HKCategoryTypeIdentifier = .environmentalAudioExposureEvent
}

/**
 A category sample type that records exposure to potentially damaging sounds from the environment.

 Apple Watch saves a `environmentalAudioExposureEvent` sample when it generates a noise notification, sent when the average sound level reaches or exceeds a specified threshold for three minutes.
 Apple Watch doesn’t record or save any sounds.
 Users can enable or disable these notifications, or set the threshold from Settings > Noise.

 Environmental audio exposure event samples are read-only.
 You can request permission to read the samples using this identifier, but you can’t request authorization to share them.
 This means you can’t save new environmental audio exposure events to the HealthKit store.
 To add test data in iOS Simulator, open the Health app and select Browse > Hearing > Noise Notifications > Add Data.

 Samples of this type use values from the ``HKCategoryValueEnvironmentalAudioExposureEvent`` enumeration.
 */
public typealias EnvironmentalAudioExposureEvent = HKCategoryEnumSample<HKCategoryValueEnvironmentalAudioExposureEvent>

import Foundation
import HealthKit

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
public struct EnvironmentalAudioExposureEvent: HKCategoryEnumSample {

    public typealias Value = HKCategoryValueEnvironmentalAudioExposureEvent

    public static let categoryTypeIdentifier: HKCategoryTypeIdentifier = .environmentalAudioExposureEvent

    public let categorySample: HKCategorySample

    public init(categorySample: HKCategorySample) {
        self.categorySample = categorySample
    }

    /**
     Create an environmental audio exposure event.
     - Parameter event: Exposure events for headphone audio.
     - Parameter audioExposureDuration: The audio level associated with an audio event.
     - Parameter audioExposureLevel: The audio level associated with an audio event.
     */
    public init(event: HKCategoryValueEnvironmentalAudioExposureEvent, audioExposureDuration: HKQuantity?, audioExposureLevel: HKQuantity?, start: Date, end: Date, device: HKDevice? = nil, metadata: [String : Any]? = nil) {
        var metadata = metadata ?? [:]
        metadata.audioExposureDuration = audioExposureDuration
        metadata.audioExposureLevel = audioExposureLevel
        self.init(value: event, start: start, end: end, device: device, metadata: metadata)
    }

    /**
     The audio exposure event’s duration.

     It contains an ``HKQuantity`` with the audio level measured in units of time.

     - String value: `HKMetadataKeyAudioExposureDuration`
     - HealthKit Constant: ``HKMetadataKeyAudioExposureDuration``
     */
    public var audioExposureDuration: HKQuantity? {
        metadata?.audioExposureDuration
    }

    /**
     The audio level associated with an audio event.

     It takes an ``HKQuantity`` containing the audio level measured in ``decibelAWeightedSoundPressureLevel()`` units.

     - Value type: ``Quantity``, unit dBASPL
     - String value: `HKMetadataKeyAudioExposureLevel`
     - HealthKit Constant: ``HKMetadataKeyAudioExposureLevel``
     */
    public var audioExposureLevel: HKQuantity? {
        metadata?.audioExposureLevel
    }
}

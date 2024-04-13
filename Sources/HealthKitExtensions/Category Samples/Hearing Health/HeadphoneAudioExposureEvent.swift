import Foundation
import HealthKit

/**
 A category sample type that records exposure to potentially damaging sounds from headphones.

 Phone and Apple Watch save a `headphoneAudioExposureEvent` sample when the device generates a notification about loud headphone audio.
 Both devices generate these notifications when the user listens to audio long enough and at a volume that could affect their hearing.
 In some regions, users can enable or disable loud headphone notifications from Settings > Sounds & Haptics > Headphone Safety.

 Samples of this type use values from the ``HKCategoryValueHeadphoneAudioExposureEvent`` enumeration.
 */
public struct HeadphoneAudioExposureEvent: HKCategoryEnumSample {

    public typealias Value = HKCategoryValueHeadphoneAudioExposureEvent

    public static let categoryTypeIdentifier: HKCategoryTypeIdentifier = .headphoneAudioExposureEvent

    public let categorySample: HKCategorySample

    public init(categorySample: HKCategorySample) {
        self.categorySample = categorySample
    }

    /**
     Create a headphone audio exposure event.
     - Parameter event: Exposure events for headphone audio.
     - Parameter audioExposureDuration: The audio level associated with an audio event.
     - Parameter audioExposureLevel: The audio level associated with an audio event.
     */
    public init(event: HKCategoryValueHeadphoneAudioExposureEvent, audioExposureDuration: HKQuantity?, audioExposureLevel: HKQuantity?, start: Date, end: Date, device: HKDevice? = nil, metadata: [String : Any]? = nil) {
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

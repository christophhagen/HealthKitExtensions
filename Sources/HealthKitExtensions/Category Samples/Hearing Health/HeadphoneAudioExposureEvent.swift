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
}

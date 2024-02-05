import Foundation
import HealthKit

public struct HighHeartRateEventIdentifier: HKCategoryTypeIdentifierProvider {
    public static let identifier: HKCategoryTypeIdentifier = .highHeartRateEvent
}

/**
 A category sample type for high heart rate events.

 The system creates highHeartRateEvent samples whenever Apple Watch produces a high heart rate notification.
 For more information, see [Heart rate notifications on your Apple Watch](https://support.apple.com/en-us/HT208931).

 The high heart rate samples are read-only.
 You can request permission to read the samples using this identifier, but you can’t request authorization to share them.
 This means you can’t save new high heart rate events to the HealthKit store.
 To add test data in iOS Simulator, open the Health app and select Browse > Heart > High Heart Rate Notifications > Add Data.

 These samples have a value of ``HKCategoryValue.notApplicable`` and include ``HKMetadataKeyHeartRateEventThreshold`` metadata.
 */
public typealias HighHeartRateEvent = HKCategoryEmptySample<HighHeartRateEventIdentifier>

extension HighHeartRateEvent {

    /// The threshold for the heart rate event (in beats per minute)
    public var heartRateEventThresholdBpm: Double? {
        metadata?.heartRateEventThresholdBpm
    }

    /// The threshold for the heart rate event (counts/time)
    public var heartRateEventThreshold: HKQuantity? {
        metadata?.heartRateEventThreshold
    }

    /**
     Create a high heart rate event including the event threshold.
     - Parameter heartRateEventThreshold: The threshold value (counts/time).
     */
    public init(heartRateEventThreshold: HKQuantity, start: Date, end: Date, device: HKDevice? = nil, metadata: [String : Any]? = nil) {
        var metadata = metadata ?? [:]
        metadata.heartRateEventThreshold = heartRateEventThreshold
        self.init(start: start, end: end, device: device, metadata: metadata)
    }

    /**
     Create a high heart rate event including the event threshold.
     - Parameter heartRateEventThreshold: The threshold value in beats per minute.
     */
    public init(heartRateEventThreshold: Double, start: Date, end: Date, device: HKDevice? = nil, metadata: [String : Any]? = nil) {
        var metadata = metadata ?? [:]
        metadata.heartRateEventThresholdBpm = heartRateEventThreshold
        self.init(start: start, end: end, device: device, metadata: metadata)
    }
}

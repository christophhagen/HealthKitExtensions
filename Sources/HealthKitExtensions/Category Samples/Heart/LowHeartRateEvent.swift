import Foundation
import HealthKit

public struct LowHeartRateEventIdentifier: HKCategoryTypeIdentifierProvider {
    public static let identifier: HKCategoryTypeIdentifier = .lowHeartRateEvent
}

/**
 The system creates `lowHeartRateEvent` samples whenever Apple Watch produces a low heart rate notification.

 For more information, see [Heart rate notifications on your Apple Watch](https://support.apple.com/en-us/HT208931).
 
 The low heart rate samples are read-only.
 You can request permission to read the samples using this identifier, but you can’t request authorization to share them.
 This means you can’t save new low heart rate events to the HealthKit store.
 To add test data in iOS Simulator, open the Health app and select Browse > Heart > Low Heart Rate Notifications > Add Data.
 These samples have a value of ``HKCategoryValue.notApplicable`` and include ``HKMetadataKeyHeartRateEventThreshold`` metadata.
 */
public typealias LowHeartRateEvent = HKCategoryEmptySample<LowHeartRateEventIdentifier>

extension LowHeartRateEvent {

    /// The threshold for the heart rate event (in beats per minute)
    public var heartRateEventThresholdBpm: Double? {
        metadata?.heartRateEventThresholdBpm
    }

    /// The threshold for the heart rate event (counts/time)
    public var heartRateEventThreshold: HKQuantity? {
        metadata?.heartRateEventThreshold
    }

    /**
     Create a low heart rate event including the event threshold.
     - Parameter heartRateEventThreshold: The threshold value (counts/time).
     */
    public init(heartRateEventThreshold: HKQuantity, start: Date, end: Date, device: HKDevice? = nil, metadata: [String : Any]? = nil) {
        var metadata = metadata ?? [:]
        metadata.heartRateEventThreshold = heartRateEventThreshold
        self.init(start: start, end: end, device: device, metadata: metadata)
    }

    /**
     Create a low heart rate event including the event threshold.
     - Parameter heartRateEventThreshold: The threshold value in beats per minute.
     */
    public init(heartRateEventThreshold: Double, start: Date, end: Date, device: HKDevice? = nil, metadata: [String : Any]? = nil) {
        var metadata = metadata ?? [:]
        metadata.heartRateEventThresholdBpm = heartRateEventThreshold
        self.init(start: start, end: end, device: device, metadata: metadata)
    }
}


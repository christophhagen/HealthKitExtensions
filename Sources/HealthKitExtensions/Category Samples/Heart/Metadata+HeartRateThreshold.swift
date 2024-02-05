import Foundation
import HealthKit

extension Metadata {

    var heartRateEventThreshold: HKQuantity? {
        get {
            self[.heartRateEventThreshold]
        }
        set {
            self[.heartRateEventThreshold] = newValue
        }
    }

    var heartRateEventThresholdBpm: Double? {
        get {
            let beatsPerMinute = HKUnit.count().unitDivided(by: .minute())
            return heartRateEventThreshold?.doubleValue(for: beatsPerMinute)
        }
        set {
            if let newValue {
                let beatsPerMinute = HKUnit.count().unitDivided(by: .minute())
                heartRateEventThreshold = HKQuantity(unit: beatsPerMinute, doubleValue: newValue)
            } else {
                heartRateEventThreshold = nil
            }
        }
    }
}

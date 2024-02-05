import Foundation
import HealthKit

public struct IrregularHeartRhythmEventIdentifier: HKCategoryTypeIdentifierProvider {
    public static let identifier: HKCategoryTypeIdentifier = .irregularHeartRhythmEvent
}

/**
 A category sample type for irregular heart rhythm events.

 The system creates `irregularHeartRhythmEvent` samples whenever Apple Watch produces an irregular rhythm notification.
 For more information, see [Heart rate notifications on your Apple Watch](https://support.apple.com/en-us/HT208931).

 The irregular rhythm samples are read-only.
 You can request permission to read the samples using this identifier, but you can’t request authorization to share them.
 This means you can’t save new irregular rhythm events to the HealthKit store.
 To add test data in iOS Simulator, open the Health app and select Browse > Heart > Irregular Rhythm Notifications > Add Data.

 These samples have a value of ``HKCategoryValue.notApplicable``.
 */
public typealias IrregularHeartRhythmEvent = HKCategoryEmptySample<IrregularHeartRhythmEventIdentifier>

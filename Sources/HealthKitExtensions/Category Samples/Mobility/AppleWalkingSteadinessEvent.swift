import Foundation
import HealthKit

/**
 A category sample type that records an incident where the user showed a reduced score for their gait’s steadiness.
 
 Samples of this type use values from the ``HKCategoryValueAppleWalkingSteadinessEvent`` enumeration.

 Walking Steadiness events are read-only.
 You can request permission to read the samples using this identifier, but you can’t request authorization to share them.
 This means you can’t save new Walking Steadiness events to the HealthKit store.
 To add test data in iOS Simulator, open the Health app and select Browse > Mobility > Walking Steadiness Notifications > Add Data.
 */
public struct AppleWalkingSteadinessEvent: HKCategoryEnumSample {

    public typealias Value = HKCategoryValueAppleWalkingSteadinessEvent

    public static let categoryTypeIdentifier: HKCategoryTypeIdentifier = .appleWalkingSteadinessEvent

    public let categorySample: HKCategorySample

    public init(categorySample: HKCategorySample) {
        self.categorySample = categorySample
    }
}

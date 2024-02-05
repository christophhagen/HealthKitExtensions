import Foundation
import HealthKit

public struct HandwashingEventIdentifier: HKCategoryTypeIdentifierProvider {
    public static let identifier: HKCategoryTypeIdentifier = .handwashingEvent
}

/**
 A category sample type for handwashing events.
 
 Use this type to read or share handwashing events.
 When creating a handwashing event sample, set the value to ``HKCategoryValue.notApplicable``, and set the duration by specifying different start and end dates. 
 The Health app uses the sample’s duration to determine if the handwashing event completed.

 Apple Watch automatically detects and records handwashing events on Apple Watch Series 4 and later.
 */
public typealias HandwashingEvent = HKCategoryEmptySample<HandwashingEventIdentifier>

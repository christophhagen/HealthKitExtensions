import Foundation
import HealthKit

public struct ToothbrushingEventIdentifier: HKCategoryTypeIdentifierProvider {
    public static let identifier: HKCategoryTypeIdentifier = .toothbrushingEvent
}

/**
 A category sample type for toothbrushing events.
 
 These samples have a value of ``HKCategoryValue.notApplicable``.
 */
public typealias ToothbrushingEvent = HKCategoryEmptySample<ToothbrushingEventIdentifier>

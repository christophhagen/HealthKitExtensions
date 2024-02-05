import Foundation
import HealthKit

@available(iOS 13.6, *)
public struct MoodChangesIdentifier: HKCategoryTypeIdentifierProvider {
    public static let identifier: HKCategoryTypeIdentifier = .moodChanges
}

/**
 A category type that records mood changes as a symptom.

 These samples use values from the ``HKCategoryValuePresence`` enumeration.
 */
@available(iOS 13.6, *)
public typealias MoodChanges = HKCategoryGenericEnumSample<MoodChangesIdentifier, HKCategoryValuePresence>

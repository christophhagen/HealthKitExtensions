import Foundation
import HealthKit

@available(iOS 13.6, *)
public struct SleepChangesIdentifier: HKCategoryTypeIdentifierProvider {
    public static let identifier: HKCategoryTypeIdentifier = .sleepChanges
}

/**
 A category type that records sleep changes as a symptom.

 These samples use values from the ``HKCategoryValuePresence`` enumeration.
 */
@available(iOS 13.6, *)
public typealias SleepChanges = HKCategoryGenericEnumSample<SleepChangesIdentifier, HKCategoryValuePresence>

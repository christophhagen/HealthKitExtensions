import Foundation
import HealthKit

/**
 A category type that records mood changes as a symptom.

 These samples use values from the ``HKCategoryValuePresence`` enumeration.
 */
@available(iOS 13.6, *)
public struct MoodChanges: HKCategoryPresenceSample {

    public static let categoryTypeIdentifier: HKCategoryTypeIdentifier = .moodChanges

    public let categorySample: HKCategorySample

    public init(categorySample: HKCategorySample) {
        self.categorySample = categorySample
    }
}

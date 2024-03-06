import Foundation
import HealthKit

/**
 A category type that records sleep changes as a symptom.

 These samples use values from the ``HKCategoryValuePresence`` enumeration.
 */
@available(iOS 13.6, *)
public struct SleepChanges: HKCategoryPresenceSample {

    public static let categoryTypeIdentifier: HKCategoryTypeIdentifier = .sleepChanges

    public let categorySample: HKCategorySample

    public init(categorySample: HKCategorySample) {
        self.categorySample = categorySample
    }
}

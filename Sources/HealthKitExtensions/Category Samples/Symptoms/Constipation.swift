import Foundation
import HealthKit

/**
 A category type that records constipation as a symptom.

 These samples use values from the ``HKCategoryValueSeverity`` enumeration.
 */
@available(iOS 13.6, *)
public struct Constipation: HKCategoryValueSeveritySample {

    public static let categoryTypeIdentifier: HKCategoryTypeIdentifier = .constipation

    public let categorySample: HKCategorySample

    public init(categorySample: HKCategorySample) {
        self.categorySample = categorySample
    }
}


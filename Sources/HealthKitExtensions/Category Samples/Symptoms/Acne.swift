import Foundation
import HealthKit

/**
 A category type that records acne as a symptom.

 These samples use values from the ``HKCategoryValueSeverity`` enumeration.
 */
public struct Acne: HKCategoryValueSeveritySample {

    public static let categoryTypeIdentifier: HKCategoryTypeIdentifier = .acne

    public let categorySample: HKCategorySample

    public init(categorySample: HKCategorySample) {
        self.categorySample = categorySample
    }
}

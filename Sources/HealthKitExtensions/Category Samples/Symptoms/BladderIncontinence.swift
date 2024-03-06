import Foundation
import HealthKit

/**
 A category type that records bladder incontinence as a symptom.

 These samples use values from the ``HKCategoryValueSeverity`` enumeration.
 */
public struct BladderIncontinence: HKCategoryValueSeveritySample {

    public static let categoryTypeIdentifier: HKCategoryTypeIdentifier = .bladderIncontinence

    public let categorySample: HKCategorySample

    public init(categorySample: HKCategorySample) {
        self.categorySample = categorySample
    }
}

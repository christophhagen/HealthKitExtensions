import Foundation
import HealthKit

/**
 A category type that records abdominal cramps as a symptom.
 
 These samples use values from the ``HKCategoryValueSeverity`` enumeration.
 */
@available(iOS 13.6, macOS 13.0, *)
public struct AbdominalCramps: HKCategoryValueSeveritySample {

    public static let categoryTypeIdentifier: HKCategoryTypeIdentifier = .abdominalCramps

    public let categorySample: HKCategorySample

    public init(categorySample: HKCategorySample) {
        self.categorySample = categorySample
    }
}

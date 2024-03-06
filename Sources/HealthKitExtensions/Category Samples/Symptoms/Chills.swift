import Foundation
import HealthKit

/**
 A category type that records chills as a symptom.

 These samples use values from the ``HKCategoryValueSeverity`` enumeration.
 */
@available(iOS 13.6, *)
public struct Chills: HKCategoryValueSeveritySample {

    public static let categoryTypeIdentifier: HKCategoryTypeIdentifier = .chills

    public let categorySample: HKCategorySample

    public init(categorySample: HKCategorySample) {
        self.categorySample = categorySample
    }
}


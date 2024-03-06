import Foundation
import HealthKit

/**
 A category type that records fever as a symptom.

 These samples use values from the ``HKCategoryValueSeverity`` enumeration.
 */
@available(iOS 13.6, *)
public struct Fever: HKCategoryValueSeveritySample {

    public static let categoryTypeIdentifier: HKCategoryTypeIdentifier = .fever

    public let categorySample: HKCategorySample

    public init(categorySample: HKCategorySample) {
        self.categorySample = categorySample
    }
}

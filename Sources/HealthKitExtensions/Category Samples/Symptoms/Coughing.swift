import Foundation
import HealthKit

/**
 A category type that records coughing as a symptom.

 These samples use values from the ``HKCategoryValueSeverity`` enumeration.
 */
@available(iOS 13.6, *)
public struct Coughing: HKCategoryValueSeveritySample {

    public static let categoryTypeIdentifier: HKCategoryTypeIdentifier = .coughing

    public let categorySample: HKCategorySample

    public init(categorySample: HKCategorySample) {
        self.categorySample = categorySample
    }
}

import Foundation
import HealthKit

/**
 A category type that records loss of taste as a symptom.

 These samples use values from the ``HKCategoryValueSeverity`` enumeration.
 */
@available(iOS 13.6, *)
public struct LossOfTaste: HKCategoryValueSeveritySample {

    public static let categoryTypeIdentifier: HKCategoryTypeIdentifier = .lossOfTaste

    public let categorySample: HKCategorySample

    public init(categorySample: HKCategorySample) {
        self.categorySample = categorySample
    }
}

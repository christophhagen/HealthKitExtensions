import Foundation
import HealthKit

/**
 A category type that records changes in appetite as a symptom.

 These samples use values from the ``HKCategoryValueAppetiteChanges`` enumeration.
 */
public struct AppetiteChanges: HKCategoryEnumSample {

    public typealias Value = HKCategoryValueAppetiteChanges

    public static let categoryTypeIdentifier: HKCategoryTypeIdentifier = .appetiteChanges

    public let categorySample: HKCategorySample

    public init(categorySample: HKCategorySample) {
        self.categorySample = categorySample
    }
}


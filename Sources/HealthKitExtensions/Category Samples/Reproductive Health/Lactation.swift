import Foundation
import HealthKit

/**
 A category type that records lactation.
 
 Use a ``HKCategoryValue.notApplicable`` value with samples of this type.
 */
public struct Lactation: HKCategoryEmptySample {

    public static let categoryTypeIdentifier: HKCategoryTypeIdentifier = .lactation

    public let categorySample: HKCategorySample

    public init(categorySample: HKCategorySample) {
        self.categorySample = categorySample
    }
}

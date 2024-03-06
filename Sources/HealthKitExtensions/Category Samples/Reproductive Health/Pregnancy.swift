import Foundation
import HealthKit

/**
 A category type that records pregnancy.
 
 Use a ``HKCategoryValue.notApplicable`` value with samples of this type.
 */
public struct Pregnancy: HKCategoryEmptySample {

    public static let categoryTypeIdentifier: HKCategoryTypeIdentifier = .pregnancy

    public let categorySample: HKCategorySample

    public init(categorySample: HKCategorySample) {
        self.categorySample = categorySample
    }
}

import Foundation
import HealthKit

public struct LactationIdentifier: HKCategoryTypeIdentifierProvider {
    public static let identifier: HKCategoryTypeIdentifier = .lactation
}

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

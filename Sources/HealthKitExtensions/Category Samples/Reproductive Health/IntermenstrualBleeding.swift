import Foundation
import HealthKit

/**
 A category sample type that records spotting outside the normal menstruation period.
 
 Use a ``HKCategoryValue.notApplicable`` value with these samples.
 */
public struct IntermenstrualBleeding: HKCategoryEmptySample {

    public static let categoryTypeIdentifier: HKCategoryTypeIdentifier = .intermenstrualBleeding

    public let categorySample: HKCategorySample

    public init(categorySample: HKCategorySample) {
        self.categorySample = categorySample
    }
}

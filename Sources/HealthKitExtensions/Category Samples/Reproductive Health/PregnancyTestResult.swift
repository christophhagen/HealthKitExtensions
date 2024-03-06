import Foundation
import HealthKit

/**
 A category type that represents the results from a home pregnancy test.
 
 Home pregnancy tests check for the presence of the human chorionic gonadotropin (hCG) hormone in a urine sample to determine if a person is pregnant.
 
 Samples of this type use values from the ``HKCategoryValuePregnancyTestResult`` enumeration.
 */
public struct PregnancyTestResult: HKCategoryEnumSample {

    public typealias Value = HKCategoryValuePregnancyTestResult

    public static let categoryTypeIdentifier: HKCategoryTypeIdentifier = .pregnancyTestResult

    public let categorySample: HKCategorySample

    public init(categorySample: HKCategorySample) {
        self.categorySample = categorySample
    }
}

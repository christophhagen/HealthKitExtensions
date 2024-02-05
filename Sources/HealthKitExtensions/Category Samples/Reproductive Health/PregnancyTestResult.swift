import Foundation
import HealthKit

extension HKCategoryValuePregnancyTestResult: HKCategoryTypeIdentifierProvider {
    public static let identifier: HKCategoryTypeIdentifier = .pregnancyTestResult
}

/**
 A category type that represents the results from a home pregnancy test.
 
 Home pregnancy tests check for the presence of the human chorionic gonadotropin (hCG) hormone in a urine sample to determine if a person is pregnant.
 
 Samples of this type use values from the ``HKCategoryValuePregnancyTestResult`` enumeration.
 */
public typealias PregnancyTestResult = HKCategoryEnumSample<HKCategoryValuePregnancyTestResult>

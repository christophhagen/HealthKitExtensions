import Foundation
import HealthKit

extension HKCategoryValueProgesteroneTestResult: HKCategoryTypeIdentifierProvider {
    public static let identifier: HKCategoryTypeIdentifier = .progesteroneTestResult
}

/**
 A category type that represents the results from a home progesterone test.
 
 Home progesterone tests check for the presence of a progesterone hormone metabolite, known as pregnanediol-3-glucuronide (PDG), in a urine sample to confirm whether ovulation has occurred.
 
 Samples of this type use values from the ``HKCategoryValueProgesteroneTestResult`` enumeration.
 */
public typealias ProgesteroneTestResult = HKCategoryEnumSample<HKCategoryValueProgesteroneTestResult>

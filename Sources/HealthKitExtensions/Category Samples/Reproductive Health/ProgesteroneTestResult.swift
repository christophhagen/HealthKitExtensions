import Foundation
import HealthKit

/**
 A category type that represents the results from a home progesterone test.
 
 Home progesterone tests check for the presence of a progesterone hormone metabolite, known as pregnanediol-3-glucuronide (PDG), in a urine sample to confirm whether ovulation has occurred.
 
 Samples of this type use values from the ``HKCategoryValueProgesteroneTestResult`` enumeration.
 */
public struct ProgesteroneTestResult: HKCategoryEnumSample {

    public typealias Value = HKCategoryValueProgesteroneTestResult

    public static let categoryTypeIdentifier: HKCategoryTypeIdentifier = .progesteroneTestResult

    public let categorySample: HKCategorySample

    public init(categorySample: HKCategorySample) {
        self.categorySample = categorySample
    }
}

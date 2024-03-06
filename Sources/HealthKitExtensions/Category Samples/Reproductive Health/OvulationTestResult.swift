import Foundation
import HealthKit

/**
 A category sample type that records the result of an ovulation home test.
 
 These samples use values from the ``HKCategoryValueOvulationTestResult`` enum.
 */
public struct OvulationTestResult: HKCategoryEnumSample {

    public typealias Value = HKCategoryValueOvulationTestResult

    public static let categoryTypeIdentifier: HKCategoryTypeIdentifier = .ovulationTestResult

    public let categorySample: HKCategorySample

    public init(categorySample: HKCategorySample) {
        self.categorySample = categorySample
    }
}

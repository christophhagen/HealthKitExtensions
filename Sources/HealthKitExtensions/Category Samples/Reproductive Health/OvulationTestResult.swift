import Foundation
import HealthKit

extension HKCategoryValueOvulationTestResult: HKCategoryTypeIdentifierProvider {
    public static let identifier: HKCategoryTypeIdentifier = .ovulationTestResult
}

/**
 A category sample type that records the result of an ovulation home test.
 
 These samples use values from the ``HKCategoryValueOvulationTestResult`` enum.
 */
public typealias OvulationTestResult = HKCategoryEnumSample<HKCategoryValueOvulationTestResult>

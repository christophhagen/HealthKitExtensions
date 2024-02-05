import Foundation
import HealthKit

@available(iOS 13.6, *)
public struct FeverIdentifier: HKCategoryTypeIdentifierProvider {
    public static let identifier: HKCategoryTypeIdentifier = .fever
}

/**
 A category type that records fever as a symptom.

 These samples use values from the ``HKCategoryValueSeverity`` enumeration.
 */
@available(iOS 13.6, *)
public typealias Fever = HKCategoryValueSeveritySample<FeverIdentifier>


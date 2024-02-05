import Foundation
import HealthKit

@available(iOS 13.6, *)
public struct HeadacheIdentifier: HKCategoryTypeIdentifierProvider {
    public static let identifier: HKCategoryTypeIdentifier = .headache
}

/**
 A category type that records headache as a symptom.

 These samples use values from the ``HKCategoryValueSeverity`` enumeration.
 */
@available(iOS 13.6, *)
public typealias Headache = HKCategoryValueSeveritySample<HeadacheIdentifier>


import Foundation
import HealthKit

@available(iOS 13.6, *)
public struct BloatingIdentifier: HKCategoryTypeIdentifierProvider {
    public static let identifier: HKCategoryTypeIdentifier = .bloating
}

/**
 A category type that records bloating as a symptom.

 These samples use values from the ``HKCategoryValueSeverity`` enumeration.
 */
@available(iOS 13.6, *)
public typealias Bloating = HKCategoryValueSeveritySample<BloatingIdentifier>


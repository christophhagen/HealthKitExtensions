import Foundation
import HealthKit

@available(iOS 13.6, *)
public struct VomitingIdentifier: HKCategoryTypeIdentifierProvider {
    public static let identifier: HKCategoryTypeIdentifier = .vomiting
}

/**
 A category type that records vomiting as a symptom.

 These samples use values from the ``HKCategoryValueSeverity`` enumeration.
 */
@available(iOS 13.6, *)
public typealias Vomiting = HKCategoryValueSeveritySample<VomitingIdentifier>

import Foundation
import HealthKit

@available(iOS 13.6, *)
public struct CoughingIdentifier: HKCategoryTypeIdentifierProvider {
    public static let identifier: HKCategoryTypeIdentifier = .coughing
}

/**
 A category type that records coughing as a symptom.

 These samples use values from the ``HKCategoryValueSeverity`` enumeration.
 */
@available(iOS 13.6, *)
public typealias Coughing = HKCategoryValueSeveritySample<CoughingIdentifier>


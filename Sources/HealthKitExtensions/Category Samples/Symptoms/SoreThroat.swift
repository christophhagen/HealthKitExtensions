import Foundation
import HealthKit

@available(iOS 13.6, *)
public struct SoreThroatIdentifier: HKCategoryTypeIdentifierProvider {
    public static let identifier: HKCategoryTypeIdentifier = .soreThroat
}

/**
 A category type that records sore throat as a symptom.

 These samples use values from the ``HKCategoryValueSeverity`` enumeration.
 */
@available(iOS 13.6, *)
public typealias SoreThroat = HKCategoryValueSeveritySample<SoreThroatIdentifier>

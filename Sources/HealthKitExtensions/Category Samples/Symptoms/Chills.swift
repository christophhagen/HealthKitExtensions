import Foundation
import HealthKit

@available(iOS 13.6, *)
public struct ChillsIdentifier: HKCategoryTypeIdentifierProvider {
    public static let identifier: HKCategoryTypeIdentifier = .chills
}

/**
 A category type that records chills as a symptom.

 These samples use values from the ``HKCategoryValueSeverity`` enumeration.
 */
@available(iOS 13.6, *)
public typealias Chills = HKCategoryValueSeveritySample<ChillsIdentifier>


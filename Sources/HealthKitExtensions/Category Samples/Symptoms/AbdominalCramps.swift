import Foundation
import HealthKit

@available(iOS 13.6, macOS 13.0, *)
public struct AbdominalCrampsIdentifier: HKCategoryTypeIdentifierProvider {
    public static let identifier: HKCategoryTypeIdentifier = .abdominalCramps
}

/**
 A category type that records abdominal cramps as a symptom.
 
 These samples use values from the ``HKCategoryValueSeverity`` enumeration.
 */
@available(iOS 13.6, macOS 13.0, *)
public typealias AbdominalCramps = HKCategoryValueSeveritySample<AbdominalCrampsIdentifier>

import Foundation
import HealthKit

@available(iOS 14.0, *)
public struct VaginalDrynessIdentifier: HKCategoryTypeIdentifierProvider {
    public static let identifier: HKCategoryTypeIdentifier = .vaginalDryness
}

/**
 A category type that records vaginal dryness as a symptom.

 These samples use values from the ``HKCategoryValueSeverity`` enumeration.
 */
@available(iOS 14.0, *)
public typealias VaginalDryness = HKCategoryValueSeveritySample<VaginalDrynessIdentifier>

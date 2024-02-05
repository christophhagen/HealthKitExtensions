import Foundation
import HealthKit

@available(iOS 13.6, *)
public struct HotFlashesIdentifier: HKCategoryTypeIdentifierProvider {
    public static let identifier: HKCategoryTypeIdentifier = .hotFlashes
}

/**
 A category type that records hot flashes as a symptom.

 These samples use values from the ``HKCategoryValueSeverity`` enumeration.
 */
@available(iOS 13.6, *)
public typealias HotFlashes = HKCategoryValueSeveritySample<HotFlashesIdentifier>


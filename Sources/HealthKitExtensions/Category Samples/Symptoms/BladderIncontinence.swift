import Foundation
import HealthKit

@available(iOS 14.0, macOS 13.0, *)
public struct BladderIncontinenceIdentifier: HKCategoryTypeIdentifierProvider {
    public static let identifier: HKCategoryTypeIdentifier = .bladderIncontinence
}

/**
 A category type that records bladder incontinence as a symptom.

 These samples use values from the ``HKCategoryValueSeverity`` enumeration.
 */
public typealias BladderIncontinence = HKCategoryValueSeveritySample<BladderIncontinenceIdentifier>

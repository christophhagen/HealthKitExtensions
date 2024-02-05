import Foundation
import HealthKit

@available(iOS 14.0, *)
public struct MemoryLapseIdentifier: HKCategoryTypeIdentifierProvider {
    public static let identifier: HKCategoryTypeIdentifier = .memoryLapse
}

/**
 A category type that records memory lapse as a symptom.

 These samples use values from the ``HKCategoryValueSeverity`` enumeration.
 */
@available(iOS 14.0, *)
public typealias MemoryLapse = HKCategoryValueSeveritySample<MemoryLapseIdentifier>

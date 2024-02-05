import Foundation
import HealthKit

@available(iOS 13.6, *)
public struct FaintingIdentifier: HKCategoryTypeIdentifierProvider {
    public static let identifier: HKCategoryTypeIdentifier = .fainting
}

/**
 A category type that records fainting as a symptom.

 These samples use values from the ``HKCategoryValueSeverity`` enumeration.
 */
@available(iOS 13.6, *)
public typealias Fainting = HKCategoryValueSeveritySample<FaintingIdentifier>


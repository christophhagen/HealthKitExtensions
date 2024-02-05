import Foundation
import HealthKit

@available(iOS 14.0, *)
public struct DrySkinIdentifier: HKCategoryTypeIdentifierProvider {
    public static let identifier: HKCategoryTypeIdentifier = .drySkin
}

/**
 A category type that records dry skin as a symptom.

 These samples use values from the ``HKCategoryValueSeverity`` enumeration.
 */
@available(iOS 14.0, *)
public typealias DrySkin = HKCategoryValueSeveritySample<DrySkinIdentifier>


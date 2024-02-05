import Foundation
import HealthKit

@available(iOS 13.6, *)
public struct SinusCongestionIdentifier: HKCategoryTypeIdentifierProvider {
    public static let identifier: HKCategoryTypeIdentifier = .sinusCongestion
}

/**
 A category type that records sinus congestion as a symptom.

 These samples use values from the ``HKCategoryValueSeverity`` enumeration.
 */
@available(iOS 13.6, *)
public typealias SinusCongestion = HKCategoryValueSeveritySample<SinusCongestionIdentifier>

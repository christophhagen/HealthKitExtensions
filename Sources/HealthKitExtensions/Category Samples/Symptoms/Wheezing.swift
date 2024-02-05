import Foundation
import HealthKit

@available(iOS 13.6, *)
public struct WheezingIdentifier: HKCategoryTypeIdentifierProvider {
    public static let identifier: HKCategoryTypeIdentifier = .wheezing
}

/**
 A category type that records wheezing as a symptom.

 These samples use values from the ``HKCategoryValueSeverity`` enumeration.
 */
@available(iOS 13.6, *)
public typealias Wheezing = HKCategoryValueSeveritySample<WheezingIdentifier>

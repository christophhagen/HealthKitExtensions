import Foundation
import HealthKit

@available(iOS 13.6, *)
public struct ConstipationIdentifier: HKCategoryTypeIdentifierProvider {
    public static let identifier: HKCategoryTypeIdentifier = .constipation
}

/**
 A category type that records constipation as a symptom.

 These samples use values from the ``HKCategoryValueSeverity`` enumeration.
 */
@available(iOS 13.6, *)
public typealias Constipation = HKCategoryValueSeveritySample<ConstipationIdentifier>


import Foundation
import HealthKit

/**
 A category type that records a rapid, pounding, or fluttering heartbeat as a symptom.

 These samples use values from the ``HKCategoryValueSeverity`` enumeration.
 */
@available(iOS 13.6, *)
public struct RapidPoundingOrFlutteringHeartbeat: HKCategoryValueSeveritySample {

    public static let categoryTypeIdentifier: HKCategoryTypeIdentifier = .rapidPoundingOrFlutteringHeartbeat

    public let categorySample: HKCategorySample

    public init(categorySample: HKCategorySample) {
        self.categorySample = categorySample
    }
}

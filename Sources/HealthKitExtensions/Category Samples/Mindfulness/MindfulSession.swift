import Foundation
import HealthKit

/**
 A category sample type for recording a mindful session.
 
 Use a ``HKCategoryValue.notApplicable`` value with these samples.
 */
public struct MindfulSession: HKCategoryEmptySample {

    public static let categoryTypeIdentifier: HKCategoryTypeIdentifier = .mindfulSession

    public let categorySample: HKCategorySample

    public init(categorySample: HKCategorySample) {
        self.categorySample = categorySample
    }
}

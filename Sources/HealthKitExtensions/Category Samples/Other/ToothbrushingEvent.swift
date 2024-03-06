import Foundation
import HealthKit

/**
 A category sample type for toothbrushing events.
 
 These samples have a value of ``HKCategoryValue.notApplicable``.
 */
public struct ToothbrushingEvent: HKCategoryEmptySample {

    public static let categoryTypeIdentifier: HKCategoryTypeIdentifier = .toothbrushingEvent

    public let categorySample: HKCategorySample

    public init(categorySample: HKCategorySample) {
        self.categorySample = categorySample
    }
}

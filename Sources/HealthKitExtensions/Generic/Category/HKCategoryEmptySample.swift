import Foundation
import HealthKit

/**
 An empty sample without a value.

 Used for all sample types where the value should be ``HKCategoryValue.notApplicable``.
 */
public struct HKCategoryEmptySample<Identifier>: HKCategorySampleContainer where Identifier: HKCategoryTypeIdentifierProvider {

    public var categorySample: HKCategorySample

    public init(categorySample: HKCategorySample) {
        self.categorySample = categorySample
    }

    public static var categoryTypeIdentifier: HKCategoryTypeIdentifier { Identifier.identifier }

    /**
     Create an empty sample without a value.

     Used for all sample types where the value should be ``HKCategoryValue.notApplicable``.
     */
    public init(start: Date, end: Date, uuid: UUID? = nil, device: HKDevice? = nil, metadata: [String : Any]? = nil) {
        self.init(categorySample: .init(
            type: .init(Identifier.identifier),
            value: HKCategoryValue.notApplicable.rawValue,
            start: start,
            end: end,
            device: device,
            metadata: metadata.adding(uuid: uuid)))
    }
}

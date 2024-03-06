import Foundation
import HealthKit

/**
 An empty sample without a value.

 Used for all sample types where the value should be ``HKCategoryValue.notApplicable``.
 */
public protocol HKCategoryEmptySample: HKCategorySampleContainer {

    static var categoryTypeIdentifier: HKCategoryTypeIdentifier { get }

    var categorySample: HKCategorySample { get }

    init(categorySample: HKCategorySample)
}

extension HKCategoryEmptySample {

    /**
     Create an empty sample without a value.

     Used for all sample types where the value should be ``HKCategoryValue.notApplicable``.
     */
    public init(start: Date, end: Date, uuid: UUID? = nil, device: HKDevice? = nil, metadata: [String : Any]? = nil) {
        self.init(categorySample: .init(
            type: .init(Self.categoryTypeIdentifier),
            value: HKCategoryValue.notApplicable.rawValue,
            start: start,
            end: end,
            device: device,
            metadata: metadata.adding(uuid: uuid)))
    }
}

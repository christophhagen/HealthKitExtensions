import Foundation
import HealthKit

public protocol HKCategorySampleContainer: HKSampleContainer {

    var categorySample: HKCategorySample { get }

    init(categorySample: HKCategorySample)

    static var categoryTypeIdentifier: HKCategoryTypeIdentifier { get }
}

extension HKCategorySampleContainer {

    public var sample: HKSample { categorySample }

    public init(sample: HKSample) {
        self.init(categorySample: sample as! HKCategorySample)
    }

    public static var categorySampleType: HKCategoryType { .init(categoryTypeIdentifier) }

    public static var sampleType: HKSampleType { categorySampleType }

    public var categorySampleType: HKCategoryType { Self.categorySampleType }
}

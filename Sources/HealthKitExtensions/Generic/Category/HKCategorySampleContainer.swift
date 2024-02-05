import Foundation
import HealthKit

public protocol HKCategorySampleContainer: HKSampleContainer {

    var categorySample: HKCategorySample { get }

    init(categorySample: HKCategorySample)

    static var categorySampleType: HKCategoryType { get }
}

extension HKCategorySampleContainer {

    public var sample: HKSample { categorySample }

    public init(sample: HKSample) {
        self.init(categorySample: sample as! HKCategorySample)
    }

    public static var sampleType: HKSampleType { categorySampleType }
}

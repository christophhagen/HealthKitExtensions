import Foundation
import HealthKit

public protocol HKSampleContainer: HKSampleTypeContainer, HKObjectContainer {

    var sample: HKSample { get }

    init(sample: HKSample)
}

extension HKSampleContainer {

    public var startDate: Date { sample.startDate }

    public var endDate: Date { sample.endDate }

    public var object: HKObject { sample }

    public static var objectType: HKObjectType { sampleType }

    public init(object: HKObject) {
        self.init(sample: object as! HKSample)
    }
}

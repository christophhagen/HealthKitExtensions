import Foundation
import HealthKit

public protocol HKSampleContainer: HKObjectContainer {

    var sample: HKSample { get }

    init(sample: HKSample)

    static var sampleType: HKSampleType { get }
}

extension HKSampleContainer {

    public var startDate: Date { sample.startDate }

    public var endDate: Date { sample.endDate }

    public var object: HKObject { sample }

    public static var objectType: HKObjectType { sampleType }

    public init(object: HKObject) {
        self.init(sample: object as! HKSample)
    }

    public var sampleType: HKSampleType { Self.sampleType }
}

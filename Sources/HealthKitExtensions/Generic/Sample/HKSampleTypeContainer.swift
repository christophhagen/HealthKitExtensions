import Foundation
import HealthKit

public protocol HKSampleTypeContainer: HKObjectTypeContainer {

    static var sampleType: HKSampleType { get }
}

extension HKSampleTypeContainer {

    public static var objectType: HKObjectType { sampleType }

    public var sampleType: HKSampleType { Self.sampleType }
}


import Foundation
import HealthKit

public protocol HKCorrelationContainer: HKSampleContainer {

    var correlation: HKCorrelation { get }

    init(correlation: HKCorrelation)

    static var correlationType: HKCorrelationType { get }
}

extension HKCorrelationContainer {

    public var sample: HKSample { correlation }

    public init(sample: HKSample) {
        self.init(correlation: sample as! HKCorrelation)
    }

    public static var sampleType: HKSampleType { correlationType }

    public var objects: Set<HKSample> {
        correlation.objects
    }

    public func objects(for objectType: HKObjectType) -> Set<HKSample> {
        correlation.objects(for: objectType)
    }

    public func samples<T>(of type: T.Type = T.self) -> [T] where T: HKQuantitySampleContainer {
        correlation.objects(for: T.quantitySampleType).map(T.init)
    }
}

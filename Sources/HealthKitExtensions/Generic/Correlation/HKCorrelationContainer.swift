import Foundation
import HealthKit

public protocol HKCorrelationContainer: HKSampleContainer {

    static var correlationType: HKCorrelationTypeIdentifier { get }

    var correlation: HKCorrelation { get }

    init(correlation: HKCorrelation)
}

extension HKCorrelationContainer {

    public static var correlationType: HKCorrelationType { .init(Self.correlationType) }

    public var correlationType: HKCorrelationType { Self.correlationType }

    public init(start: Date, end: Date, objects: Set<HKSample>, uuid: UUID? = nil, device: HKDevice? = nil, metadata: [String : Any]? = nil) {
        self.init(correlation: .init(
            type: .init(Self.correlationType),
            start: start,
            end: end, 
            objects: objects,
            device: device,
            metadata: metadata.adding(uuid: uuid)))
    }

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

import Foundation
import HealthKit

public protocol HKCorrelationContainer: HKSampleContainer {

    static var correlationTypeIdentifier: HKCorrelationTypeIdentifier { get }

    var correlation: HKCorrelation { get }

    init(correlation: HKCorrelation)
}

extension HKCorrelationContainer {

    public static var correlationType: HKCorrelationType { .init(Self.correlationTypeIdentifier) }

    public var correlationType: HKCorrelationType { Self.correlationType }

    public init(start: Date, end: Date, objects: Set<HKSample>, uuid: UUID? = nil, device: HKDevice? = nil, metadata: [String : Any]? = nil) {
        self.init(correlation: .init(
            type: .init(Self.correlationTypeIdentifier),
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

    func first<T>() -> T? where T: HKQuantitySampleContainer {
        objects.first { ($0 as? HKQuantitySample)?.quantityType == T.quantitySampleType }
            .map { T.init(sample: $0) }
    }
}

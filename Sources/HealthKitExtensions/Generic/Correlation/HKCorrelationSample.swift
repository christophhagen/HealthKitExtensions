import Foundation
import HealthKit

public struct HKCorrelationSample<Identifier>: HKCorrelationContainer where Identifier: HKCorrelationTypeIdentifierProvider {

    public var correlation: HKCorrelation

    public init(correlation: HKCorrelation) {
        self.correlation = correlation
    }

    public static var correlationType: HKCorrelationType { .init(Identifier.identifier) }

    public init(start: Date, end: Date, objects: Set<HKSample>, uuid: UUID? = nil, device: HKDevice? = nil, metadata: [String : Any]? = nil) {
        self.init(correlation: .init(
            type: .init(Identifier.identifier),
            start: start,
            end: end, 
            objects: objects,
            device: device,
            metadata: metadata.adding(uuid: uuid)))
    }
}

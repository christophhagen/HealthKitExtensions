import Foundation
import HealthKit

/**
 A correlation sample that combines a systolic sample and a diastolic sample into a single blood pressure reading.
 */
public struct BloodPressure: HKCorrelationContainer {

    public static let correlationTypeIdentifier: HKCorrelationTypeIdentifier = .bloodPressure

    public let correlation: HKCorrelation

    public init(correlation: HKCorrelation) {
        self.correlation = correlation
    }
}

extension BloodPressure {

    public init(systolic: Double, diastolic: Double, start: Date, end: Date, uuid: UUID? = nil, device: HKDevice? = nil, metadata: [String : Any]? = nil) {

        let objects: Set<HKSample> = [
            BloodPressureSystolic(value: systolic, start: start, end: end).sample,
            BloodPressureDiastolic(value: diastolic, start: start, end: end).sample
        ]
        self.init(start: start, end: end, objects: objects, uuid: uuid, device: device, metadata: metadata)
    }

    public init(systolic: HKQuantity, diastolic: HKQuantity, start: Date, uuid: UUID? = nil, end: Date, device: HKDevice? = nil, metadata: [String : Any]? = nil) {

        let objects: Set<HKSample> = [
            BloodPressureSystolic(quantity: systolic, start: start, end: end).sample,
            BloodPressureDiastolic(quantity: diastolic, start: start, end: end).sample
        ]
        self.init(start: start, end: end, objects: objects, uuid: uuid, device: device, metadata: metadata)
    }

    public var foodType: String? {
        metadata?[.foodType]
    }

    /// The associated systolic blood pressure sample
    public var systolic: BloodPressureSystolic? {
        first()
    }

    /// The associated diastolic blood pressure sample
    public var diastolic: BloodPressureDiastolic? {
        first()
    }
}


import Foundation
import HealthKit

/**
 Food correlation types combine any number of nutritional samples into a single food object.
 
 When creating food samples, specify the type of food using the ``HKMetadataKeyFoodType`` metadata key.
 */
public struct Food: HKCorrelationContainer {

    public static let correlationTypeIdentifier: HKCorrelationTypeIdentifier = .food

    public let correlation: HKCorrelation

    public init(correlation: HKCorrelation) {
        self.correlation = correlation
    }
}


extension Food {

    public init(foodType: String, dietaryEnergyConsumed: Double, start: Date, end: Date, nutritionSamples: [HKDietaryQuantity], uuid: UUID? = nil, device: HKDevice? = nil, metadata: [String : Any]? = nil) {
        var metadata = metadata ?? [:]
        metadata.foodType = foodType

        var objects = Set(nutritionSamples.map { $0.sample })
        let energyConsumed = DietaryEnergyConsumed(value: dietaryEnergyConsumed, start: start, end: end)
        objects.insert(energyConsumed.sample)
        self.init(start: start, end: end, objects: objects, uuid: uuid, device: device, metadata: metadata)
    }

    public var foodType: String? {
        metadata?.foodType
    }

    /// The associated sample of consumed dietary energy
    public var dietaryEnergyConsumed: DietaryEnergyConsumed? {
        first()
    }
}


import Foundation
import HealthKit

/**
 Food correlation types combine any number of nutritional samples into a single food object.
 
 When creating food samples, specify the type of food using the ``HKMetadataKeyFoodType`` metadata key.
 */
public struct FoodIdentifier: HKCorrelationTypeIdentifierProvider {

    public static let identifier: HKCorrelationTypeIdentifier = .food
}

public typealias Food = HKCorrelationSample<FoodIdentifier>

extension Food {

    public init(foodType: String, dietaryEnergyConsumed: Double, start: Date, end: Date, nutritionSamples: [HKDietaryQuantitySampleContainer], uuid: UUID? = nil, device: HKDevice? = nil, metadata: [String : Any]? = nil) {
        var metadata = metadata ?? [:]
        metadata[.foodType] = foodType

        var objects = Set(nutritionSamples.map { $0.sample })
        objects.insert(DietaryEnergyConsumed(value: dietaryEnergyConsumed, start: start, end: end).sample)
        self.init(start: start, end: end, objects: objects, uuid: uuid, device: device, metadata: metadata)
    }

    public var foodType: String? {
        metadata?[.foodType]
    }
}


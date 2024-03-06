import Foundation
import HealthKit

public enum MetadataKey {

    /**
     A unique identifier for an HKObject that is set by its source.
     
     This key takes a ``String`` value.
     This value is independent of the UUID assigned to the object by the HealthKit store.
     You can assign your own UUID to any HealthKit objects you create.
     Use these IDs to uniquely identify objects in your application.
     You typically use the UUID from the corresponding data entry on your server.
     This lets you create multiple copies of that data across multiple devices.
     Each copy shares the same external UUID.
     */
    case externalUUID

    /**
     A key that records the threshold of high or low heart rate events in beats per minute.
     
     The value for this key contains an ``HKQuantity`` object with count/time units, described in ``HKUnit``.
     This metadata key is used by ``highHeartRateEvent`` and ``lowHeartRateEvent`` category samples.
     */
    case heartRateEventThreshold

    /**
     The maximum oxygen consumption rate during exercise of increasing intensity.
     
     The system sets this key on ``lowCardioFitnessEvent`` samples.
     It contains the value of the VO2 max measurement that triggered the event.
     The value of this key is an ``HKQuantity`` object with a unit of `ml/(kg*min)`.
     For more information on working with complex units, see [unitMultiplied(by:)](doc://com.apple.documentation/documentation/healthkit/hkunit/1615718-unitmultiplied), [unitDivided(by:)](doc://com.apple.documentation/documentation/healthkit/hkunit/1615242-unitdivided), and [init(from:)](doc://com.apple.documentation/documentation/healthkit/hkunit/1615733-init).
     */
    case vo2MaxValue

    /**
     The VO2 max threshold used to categorize low-level cardio fitness events.
     
     The system sets this key on ``lowCardioFitnessEvent`` samples.
     It contains the threshold value for the user’s VO2 max measurements.
     The threshold value varies depending on certain parameters and physical characteristics, such as the user’s age.
     
     A low-cardio fitness event indicates a period of time when the user’s VO2 max measurements consistently fall below the defined value.
     The system triggers this event approximately once every four months.

     The value of this key is an ``HKQuantity`` object with a unit of `ml/(kg*min)`.
     For more information on working with complex units, see [unitMultiplied(by:)](doc://com.apple.documentation/documentation/healthkit/hkunit/1615718-unitmultiplied), [unitDivided(by:)](doc://com.apple.documentation/documentation/healthkit/hkunit/1615242-unitdivided), and [init(from:)](doc://com.apple.documentation/documentation/healthkit/hkunit/1615733-init).
     */
    case lowCardioFitnessEventThreshold

    /**
     A key that indicates whether the sample represents the start of a menstrual cycle. 
     This metadata key is required for ``menstrualFlow`` category samples.

     Set this key’s value to true if the sample represents the start of a menstrual cycle; otherwise, set it to false.
     */
    case menstrualCycleStart

    /**
     A key that indicates whether protection was used during sexual activity. 
     This metadata key can be used with ``sexualActivity`` category samples.

     Set this key’s value to true if protection was used during sexual activity; otherwise, set it to false.
     */
    case sexualActivityProtectionUsed

    /**
     The user’s time zone when the HealthKit object was created.
     
     This key takes a string value compatible with the ``NSTimeZone`` class’s ``timeZoneWithName:`` method.
     For best results when analyzing sleep samples, it's recommended that you store time zone metadata with your sleep sample data.
     */
    case timeZone

    /**
     The user’s activity level when the heart rate sample was measured.
     
     This key takes an ``NSNumber`` containing an ``HKHeartRateMotionContext`` as its value.
     */
    case heartRateMotionContext

    /**
     The method used to calculate the user’s VO2 max rate.

     This key takes an ``NSNumber`` object containing a ``HKVO2MaxTestType`` value.
     */
    case vO2MaxTestType

    /**
     The key for metadata indicating whether the system had data from a sufficient amount of calibrated sensors when recording the sample.
     
     This key takes a Boolean value.
     If it’s true, the system has enough high-quality data to make an accurate estimate.
     If it’s false, the system provides an estimate based on data that may be less accurate.
     
     The key is read-only.
     */
    case appleDeviceCalibrated

    /**
     The key for metadata indicating the placement of the device that measured a sample.

     This key takes an ``NSNumber`` that contains a value from ``HKDevicePlacementSide``.
     For mobility samples, like ``walkingSpeed`` or ``walkingDoubleSupportPercentage``, this metadata key records the placement of the device as determined by the system.
     */
    case devicePlacementSide

    /**
     The type of food that the HealthKit object represents.

     This key takes a string value.
     Food objects are usually food samples containing any number of Nutrition Identifiers samples.
     */
    case foodType

    /**
     The medical reason for administering insulin.

     This key is required for ``insulinDelivery`` samples.
     It takes an ``NSNumber`` object containing a ``HKInsulinDeliveryReason`` value.
     */
    case insulinDeliveryReason

    public var rawValue: String {
        switch self {
        case .externalUUID: return HKMetadataKeyExternalUUID
        case .heartRateEventThreshold: return HKMetadataKeyHeartRateEventThreshold
        case .vo2MaxValue: return HKMetadataKeyVO2MaxValue
        case .lowCardioFitnessEventThreshold: return HKMetadataKeyLowCardioFitnessEventThreshold
        case .menstrualCycleStart: return HKMetadataKeyMenstrualCycleStart
        case .sexualActivityProtectionUsed: return HKMetadataKeySexualActivityProtectionUsed
        case .timeZone: return HKMetadataKeyTimeZone
        case .heartRateMotionContext: return HKMetadataKeyHeartRateMotionContext
        case .vO2MaxTestType: return HKMetadataKeyVO2MaxTestType
        case .appleDeviceCalibrated: return HKMetadataKeyAppleDeviceCalibrated
        case .devicePlacementSide: return HKMetadataKeyDevicePlacementSide
        case .foodType: return HKMetadataKeyFoodType
        case .insulinDeliveryReason: return HKMetadataKeyInsulinDeliveryReason
        }
    }
}

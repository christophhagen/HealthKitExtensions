import Foundation
import HealthKit

/**
 A known metadata key.

 This enum collects the metadata keys for `HKObject` metadata.
 The cases are derived from the constants in `HealthKit` with the prefix `HKMetadataKey`
 (e.g. `HKMetadataKeyActivityType` becomes `HKMetadataKey.activityType`).
 */
public enum HKMetadataKey: String {

    /**
     Represents the test used to determine a Cycling Functional Threshold Power value.

     The expected value type is an ``NSNumber`` containing a ``HKCyclingFunctionalThresholdPowerTestType`` value.

     - Value type: ``NSNumber``
     - String value: `HKCyclingCyclingFunctionalThresholdPowerTestType`
     - HealthKit Constant: ``HKMetadataKeyCyclingFunctionalThresholdPowerTestType``
     */
    @available(macOS 14.0, iOS 17.0, watchOS 10.0, *)
    case cyclingFunctionalThresholdPowerTestType = "HKCyclingCyclingFunctionalThresholdPowerTestType"

    /**
     Represents the activity type related to the sample

     The expected value type is an ``NSNumber`` containing a ``HKWorkoutActivityType`` value.

     - Value type: ``NSNumber``
     - String value: `HKActivityType`
     - HealthKit Constant: ``HKMetadataKeyActivityType``
     */
    @available(iOS 17.0, macOS 14.0, watchOS 10.0, *)
    case activityType = "HKActivityType"

    /**
     A key that indicates the percent slope of a ski run.

     Set this key on quantity samples that represent distance, or on workout segments.
     Set its value to an ``HKQuantity`` object with a percent unit, where 100% indicates a 45 degree slope.

     HealthKit assigns this metadata key to the segments it automatically creates for ``HKWorkoutActivityType.downhillSkiing`` and ``HKWorkoutActivityType.snowboarding`` workout sessions (Apple Watch Series 3 only).
     - Value type: ``HKQuantity``
     - String value: `HKAlpineSlopeGrade`
     - HealthKit Constant: ``HKMetadataKeyAlpineSlopeGrade``
     */
    case alpineSlopeGrade = "HKAlpineSlopeGrade"

    /**
     A key that indicates the version number of the algorithm used to calculate the sample’s value.

     This key takes an ``NSNumber`` containing an ``NSInteger``.

     - Note: In watchOS 8, the system uses this key for ``heartRateVariabilitySDNN`` and ``HKHeartbeatSeriesSample`` samples generated by Apple Watch.

     - Value type: ``NSNumber``
     - String value: `HKAlgorithmVersion`
     - HealthKit Constant: ``HKMetadataKeyAlgorithmVersion``
     */
    case algorithmVersion = "HKAlgorithmVersion"

    /**
     The key for metadata indicating whether the system had data from a sufficient amount of calibrated sensors when recording the sample.

     This key takes a Boolean value.
     If it’s true, the system has enough high-quality data to make an accurate estimate.
     If it’s false, the system provides an estimate based on data that may be less accurate.

     The key is read-only.

     - Value type: ``NSNumber``
     - String value: `HKMetadataKeyAppleDeviceCalibrated`
     - HealthKit Constant: ``HKMetadataKeyAppleDeviceCalibrated``
     */
    case appleDeviceCalibrated = "HKMetadataKeyAppleDeviceCalibrated"

    /**
     A key for metadata indicating the version number of the algorithm Apple Watch uses to generate an ECG reading.

     Apple Watch sets this key on the ``HKElectrocardiogram`` samples it creates. The key is read-only.
     - Value type: ``NSNumber``
     - String value: `HKMetadataKeyAppleECGAlgorithmVersion`
     - HealthKit Constant: ``HKMetadataKeyAppleECGAlgorithmVersion``
     */
    case appleECGAlgorithmVersion = "HKMetadataKeyAppleECGAlgorithmVersion"

    /**
     The audio exposure event’s duration.

     Use this key on headphone audio exposure events.
     It takes an ``HKQuantity`` containing the audio level measured in units of time.

     - Value type: ``HKQuantity``
     - String value: `HKMetadataKeyAudioExposureDuration`
     - HealthKit Constant: ``HKMetadataKeyAudioExposureDuration``
     */
    case audioExposureDuration = "HKMetadataKeyAudioExposureDuration"

    /**
     The audio level associated with an audio event.

     Use this key on audio exposure events.
     It takes an ``HKQuantity`` containing the audio level measured in ``decibelAWeightedSoundPressureLevel()`` units.

     - Value type: ``Quantity``, unit dBASPL
     - String value: `HKMetadataKeyAudioExposureLevel`
     - HealthKit Constant: ``HKMetadataKeyAudioExposureLevel``
     */
    case audioExposureLevel = "HKMetadataKeyAudioExposureLevel"

    /**
     - Value type: ``Quantity``, unit kcal/hr·kg
     - String value: `HKAverageMETs`
     - HealthKit Constant: ``HKMetadataKeyAverageMETs``
     */
    case averageMETs = "HKAverageMETs"

    /**
     A key that indicates the average speed during a workout.

     Set this key on a workout, workout segment, or a quantity sample that represents distance.
     Set its value to an ``HKQuantity`` object with a length/time unit (for example, m/s).
     For more information on creating complex units, see [Performing unit math](https://developer.apple.com/documentation/healthkit/hkunit#1677276).

     HealthKit assigns this metadata key to the segments it automatically creates for ``HKWorkoutActivityType.downhillSkiing`` and ``HKWorkoutActivityType.snowboarding`` workout sessions (Apple Watch Series 3 only).
     - Note: This value represents the average speed while moving.
     It may not be the same as the value you get when dividing a distance sample’s distance by its duration.
     - Value type: ``HKQuantity``
     - String value: `HKAverageSpeed`
     - HealthKit Constant: ``HKMetadataKeyAverageSpeed``
     */
    case averageSpeed = "HKAverageSpeed"

    /**
     - Value type: ``Quantity``, unit kPa
     - String value: `HKMetadataKeyBarometricPressure`
     - HealthKit Constant: ``HKMetadataKeyBarometricPressure``
     */
    case barometricPressure = "HKMetadataKeyBarometricPressure"

    /**
     A key that indicates the relative timing of a blood glucose reading to a meal.

     Set this key on a `bloodGlucose` sample.
     Set it's value to an ``NSNumber`` object containing a ``HKBloodGlucoseMealTime`` value.
     Medical professionals can use the relative meal time to help determine the acceptable range for a blood glucose reading.
     If your app requires more precise timing or additional information about the meal's composition, create samples to record those details (for example, a `dietaryCarbohydrates` sample with the exact meal time).
     - Value type: ``NSNumber`` for a ``HKBloodGlucoseMealTime``
     - String value: `HKBloodGlucoseMealTime`
     - HealthKit Constant: ``HKMetadataKeyBloodGlucoseMealTime``
     */
    case bloodGlucoseMealTime = "HKBloodGlucoseMealTime"

    /**
     The location where a specific body temperature reading was taken.

     This key takes an ``NSNumber`` object whose value is ``HKBodyTemperatureSensorLocation``.
     - Value type: ``NSNumber``
     - String value: `HKBodyTemperatureSensorLocation`
     - HealthKit Constant: ``HKMetadataKeyBodyTemperatureSensorLocation``
     */
    case bodyTemperatureSensorLocation = "HKBodyTemperatureSensorLocation"

    /**
     A key that indicates whether the workout was performed with a coach or personal trainer.

     Set this key’s value to true if the workout was performed with a coach or personal trainer; otherwise, set it to false.
     - Value type: ``Bool``
     - String value: `HKCoachedWorkout`
     - HealthKit Constant: ``HKMetadataKeyCoachedWorkout``
     */
    case coachedWorkout = "HKCoachedWorkout"

    /**
     The workout distance displayed by a connected GymKit cross-trainer machine.

     Set this key on a workout sample representing exercise on a GymKit cross-trainer machine (such as an elliptical cross-trainer).
     Set its value to an ``HKQuantity`` object with a length unit.
     - Value type: ``HKQuantity``
     - String value: `HKCrossTrainerDistance`
     - HealthKit Constant: ``HKMetadataKeyCrossTrainerDistance``
     */
    case crossTrainerDistance = "HKCrossTrainerDistance"

    /**
     The earliest date of data used to calculate the sample’s estimated value.

     This key takes a ``Date`` value, indicating the earliest date from the data used by HealthKit to calculate the sample’s value.
     - Value type: ``Date``
     - String value: `HKDateOfEarliestDataUsedForEstimate`
     - HealthKit Constant: ``HKMetadataKeyDateOfEarliestDataUsedForEstimate``
     */
    case dateOfEarliestDataUsedForEstimate = "HKDateOfEarliestDataUsedForEstimate"

    /**
     The name of the manufacturer of the device that took this reading.

     This key takes a string value.
     - Note: In iOS 9.0 and later, the use of this key is discouraged. Use the ``HKDevice`` class instead.
     - Value type: ``String``
     - String value: `HKMetadataKeyDeviceManufacturerName`
     - HealthKit Constant: ``HKMetadataKeyDeviceManufacturerName``
     */
    case deviceManufacturerName = "HKDeviceManufacturerName"

    /**
     The name of the device that took this reading.

     - Note: In iOS 9.0 and later, the use of this key is discouraged. Use the ``HKDevice`` class instead.
     - Value type: ``String``
     - String value: `HKDateOfEarliestDataUsedForEstimate`
     - HealthKit Constant: ``HKMetadataKeyDeviceName``
     */
    case deviceName = "HKDeviceName"

    /**
     The key for metadata indicating the placement of the device that measured a sample.

     This key takes an ``NSNumber`` that contains a value from ``HKDevicePlacementSide``.
     For mobility samples, like ``walkingSpeed`` or ``walkingDoubleSupportPercentage``, this metadata key records the placement of the device as determined by the system.
     - Value type: ``NSNumber``
     - String value: `HKMetadataKeyDevicePlacementSide`
     - HealthKit Constant: ``HKMetadataKeyDevicePlacementSide``
     */
    case devicePlacementSide = "HKMetadataKeyDevicePlacementSide"

    /**
     The key for the serial number of the device that generated the data.

     This key takes a string value.
     - Value type: ``String``
     - String value: `HKDeviceSerialNumber`
     - HealthKit Constant: ``HKMetadataKeyDeviceSerialNumber``
     */
    case deviceSerialNumber = "HKDeviceSerialNumber"

    /**
     A digital signature that can be used to validate the origin of the HealthKit object.

     The digital signature is intended to provide data integrity for sample data produced by trusted (tamper resistant) measuring devices.
     Use the Cryptographic Message Syntax (CMS) to sign data returned by your device (such as timestamps, values, and so forth) using ASN.1 encoding with Distinguished Encoding Rules (DER).
     The entire signature should be further encoded using base64.
     Recommended digest is SHA256, and recommended cipher is FIPS PUB 186-4 Digital Signature Standard Elliptic Curve P-256.
     CMS is specified in IETF RFC 5652.
     For more information, see [Adding Digital Signatures in HealthKit]().
     - Value type: ``String``
     - String value: `HKDigitalSignature`
     - HealthKit Constant: ``HKMetadataKeyDigitalSignature``
     */
    case digitalSignature = "HKDigitalSignature"

    /**
     - Value type: ``Quantity``, unit cm
     - String value: `HKElevationAscended`
     - HealthKit Constant: ``HKMetadataKeyElevationAscended``
     */
    case elevationAscended = "HKElevationAscended"

    /**
     A unique identifier for an HKObject that is set by its source.

     This key takes a ``String`` value.
     This value is independent of the UUID assigned to the object by the HealthKit store.
     You can assign your own UUID to any HealthKit objects you create.
     Use these IDs to uniquely identify objects in your application.
     You typically use the UUID from the corresponding data entry on your server.
     This lets you create multiple copies of that data across multiple devices.
     Each copy shares the same external UUID.

     - Value type: ``String``
     - String value: `HKExternalUUID`
     - HealthKit Constant: ``HKMetadataKeyExternalUUID``
     */
    case externalUUID = "HKExternalUUID"

    /**
     The workout duration displayed by a connected GymKit fitness machine.

     Set this key on a workout sample representing exercise on a GymKit fitness machine.
     Set its value to an ``HKQuantity`` object with a time unit.
     - Value type: ``HKQuantity``
     - String value: `HKFitnessMachineDuration`
     - HealthKit Constant: ``HKMetadataKeyFitnessMachineDuration``
     */
    case fitnessMachineDuration = "HKFitnessMachineDuration"

    /**
     Represents whether or not a workout is a Fitness+ workout.

     The expected value type is an ``NSNumber`` containing a ``Bool`` value.
     - Value type: ``Bool``
     - String value: `HKMetadataKeyAppleFitnessPlusSession`
     - HealthKit Constant: ``HKMetadataKeyAppleFitnessPlusSession``
     */
    @available(macOS 14.0, iOS 17.0, watchOS 10.0, *)
    case fitnessPlusSession = "HKMetadataKeyAppleFitnessPlusSession"

    /**
     The type of food that the HealthKit object represents.

     This key takes a string value.
     Food objects are usually food samples containing any number of Nutrition Identifiers samples.
     - Value type: ``String``
     - String value: `HKFoodType`
     - HealthKit Constant: ``HKMetadataKeyFoodType``
     */
    case foodType = "HKFoodType"

    /**
     A description of the glasses prescription.

     If a glasses prescription was designed for a particular use, like reading or distance, use this metadata key to describe that use.

     - Value type: ``String``
     - String value: `HKMetadataKeyGlassesPrescriptionDescription`
     - HealthKit Constant: ``HKMetadataKeyGlassesPrescriptionDescription``
     */
    @available(iOS 16.0, macOS 13.0, watchOS 9.0, *)
    case glassesPrescriptionDescription = "HKMetadataKeyGlassesPrescriptionDescription"

    /**
     A key that indicates whether the workout was performed as part of a group fitness class.

     Set this key’s value to true if the workout was part of a group fitness class; otherwise, set it to false.
     - Value type: ``Bool``
     - String value: `HKMetadataKeyGroupFitness`
     - HealthKit Constant: ``HKMetadataKeyGroupFitness``
     */
    case groupFitness = "HKGroupFitness"

    /**
     Represents the headphone gain associated with a Headphone audio exposure event.

     The expected value is an ``HKQuantity`` whose value is the gain associated with the event measured in decibels in A-weighted Sound Pressure Level units.
     - Value type: ``HKQuantity``
     - String value: `HKMetadataKeyHeadphoneGain`
     - HealthKit Constant: ``HKMetadataKeyHeadphoneGain``
     */
    @available(iOS 16.4, macOS 13.3, watchOS 9.4, *)
    case headphoneGain = "HKMetadataKeyHeadphoneGain"

    /**
     A key that records the threshold of high or low heart rate events in beats per minute.
     
     The value for this key contains an ``HKQuantity`` object with count/time units, described in ``HKUnit``.
     This metadata key is used by ``highHeartRateEvent`` and ``lowHeartRateEvent`` category samples.
     - Value type: ``Quantity``, unit count/min
     - String value: `HKHeartRateEventThreshold`
     - HealthKit Constant: ``HKMetadataKeyHeartRateEventThreshold``
     */
    case heartRateEventThreshold = "HKHeartRateEventThreshold"

    /**
     The user’s activity level when the heart rate sample was measured.

     This key takes an ``NSNumber`` containing an ``HKHeartRateMotionContext`` as its value.
     - Value type: ``Int``
     - String value: ``
     - HealthKit Constant: ``HKMetadataKeyHeartRateMotionContext``
     */
    case heartRateMotionContext = "HKMetadataKeyHeartRateMotionContext"

    /**
     - Value type: ``Quantity``, unit s
     - String value: `HKMetadataKeyHeartRateRecoveryActivityDuration`
     - HealthKit Constant: ``HKMetadataKeyHeartRateRecoveryActivityDuration``
     */
    @available(iOS 16.0, macOS 13.0, watchOS 9.0, *)
    case heartRateRecoveryActivityDuration = "HKMetadataKeyHeartRateRecoveryActivityDuration"

    /**
     - Value type: ``NSNumber``
     - String value: `HKMetadataKeyHeartRateRecoveryActivityType`
     - HealthKit Constant: ``HKMetadataKeyHeartRateRecoveryActivityType``
     */
    @available(iOS 16.0, macOS 13.0, watchOS 9.0, *)
    case heartRateRecoveryActivityType = "HKMetadataKeyHeartRateRecoveryActivityType"

    /**
     - Value type: ``Quantity``, unit count/min
     - String value: `HKMetadataKeyHeartRateRecoveryMaxObservedRecoveryHeartRate`
     - HealthKit Constant: ``HKMetadataKeyHeartRateRecoveryMaxObservedRecoveryHeartRate``
     */
    @available(iOS 16.0, macOS 13.0, watchOS 9.0, *)
    case heartRateRecoveryMaxObservedRecoveryHeartRate = "HKMetadataKeyHeartRateRecoveryMaxObservedRecoveryHeartRate"

    /**
     The type of test that the source used to calculate a person’s heart-rate recovery.

     Use this metadata key to identify the type of test that the ``HKSource`` used to calculate the value for a ``heartRateRecoveryOneMinute`` sample.

     - Value type: ``NSNumber``
     - String value: `HKMetadataKeyHeartRateRecoveryTestType`
     - HealthKit Constant: ``HKMetadataKeyHeartRateRecoveryTestType``
     */
    @available(iOS 16.0, macOS 13.0, watchOS 9.0, *)
    case heartRateRecoveryTestType = "HKMetadataKeyHeartRateRecoveryTestType"

    /**
     The location where a specific heart rate reading was taken.

     This key takes an NSNumber containing an ``HKHeartRateSensorLocation`` as its value.
     - Value type: ``NSNumber``
     - String value: `HKHeartRateSensorLocation`
     - HealthKit Constant: ``HKMetadataKeyHeartRateSensorLocation``
     */
    case heartRateSensorLocation = "HKHeartRateSensorLocation"

    /**
     The workout distance displayed by a connected GymKit exercise bike.

     Set this key on a workout sample representing exercise on a GymKit exercise bike.
     Set its value to an ``HKQuantity`` object with a length unit.
     - Value type: ``HKQuantity``
     - String value: `HKIndoorBikeDistance`
     - HealthKit Constant: ``HKMetadataKeyIndoorBikeDistance``
     */
    case indoorBikeDistance = "HKIndoorBikeDistance"

    /**
     - Value type: ``NSNumber``
     - String value: `HKIndoorWorkout`
     - HealthKit Constant: ``HKMetadataKeyIndoorWorkout``
     */
    case indoorWorkout = "HKIndoorWorkout"

    /**
     The medical reason for administering insulin.

     This key is required for ``insulinDelivery`` samples.
     It takes an ``NSNumber`` object containing a ``HKInsulinDeliveryReason`` value.
     - Value type: ``NSNumber``
     - String value: `HKInsulinDeliveryReason`
     - HealthKit Constant: ``HKMetadataKeyInsulinDeliveryReason``
     */
    case insulinDeliveryReason = "HKInsulinDeliveryReason"

    /**
     The version number for a piece of data, used when updating or syncing.

     This key takes an ``NSNumber`` as its value.
     When you save an object to the HealthKit store, the new object replaces any matching objects (existing objects with a matching ``HKMetadataKeySyncIdentifier`` value) with a lower sync version.
     For more information, see ``HKMetadataKeySyncIdentifier``.
     - Value type: ``NSNumber``
     - String value: `HKMetadataKeySyncVersion`
     - HealthKit Constant: ``HKMetadataKeySyncVersion``
     */
    case keySyncVersion = "HKMetadataKeySyncVersion"

    /**
     The VO2 max threshold used to categorize low-level cardio fitness events.

     The system sets this key on ``lowCardioFitnessEvent`` samples.
     It contains the threshold value for the user’s VO2 max measurements.
     The threshold value varies depending on certain parameters and physical characteristics, such as the user’s age.

     A low-cardio fitness event indicates a period of time when the user’s VO2 max measurements consistently fall below the defined value.
     The system triggers this event approximately once every four months.

     The value of this key is an ``HKQuantity`` object with a unit of `ml/(kg*min)`.
     For more information on working with complex units, see [unitMultiplied(by:)](doc://com.apple.documentation/documentation/healthkit/hkunit/1615718-unitmultiplied), [unitDivided(by:)](doc://com.apple.documentation/documentation/healthkit/hkunit/1615242-unitdivided), and [init(from:)](doc://com.apple.documentation/documentation/healthkit/hkunit/1615733-init).
     - Value type: ``HKQuantity``, unit `ml/(kg*min)`
     - String value: `HKLowCardioFitnessEventThreshold`
     - HealthKit Constant: ``HKMetadataKeyLowCardioFitnessEventThreshold``
     */
    case lowCardioFitnessEventThreshold = "HKLowCardioFitnessEventThreshold"

    /**
     - Value type: ``HKQuantity``, unit meter
     - String value: `HKLapLength`
     - HealthKit Constant: ``HKMetadataKeyLapLength``
     */
    case lapLength = "HKLapLength"

    /**
     - Value type: ``Quantity``, unit lx
     - String value: `HKMetadataKeyMaximumLightIntensity`
     - HealthKit Constant: ``HKMetadataKeyMaximumLightIntensity``
     */
    @available(watchOS 10.0, iOS 17.0, macOS 14.0, *)
    case maximumLightIntensity = "HKMetadataKeyMaximumLightIntensity"

    /**
     A key that indicates the maximum speed during a workout.

     Set this key on a workout, workout segment, or a quantity sample that represents distance.
     Set its value to an ``HKQuantity`` object with a length/time unit (for example, m/s).
     For more information on creating complex units, see [Performing unit math]().

     HealthKit assigns this metadata key to the segments it automatically creates for ``HKWorkoutActivityType.downhillSkiing`` and ``HKWorkoutActivityType.snowboarding`` workout sessions (Apple Watch Series 3 only).
     - Value type: ``HKQuantity``
     - String value: `HKMaximumSpeed`
     - HealthKit Constant: ``HKMetadataKeyMaximumSpeed``
     */
    case maximumSpeed = "HKMaximumSpeed"

    /**
     A key that indicates whether the sample represents the start of a menstrual cycle.
     This metadata key is required for ``menstrualFlow`` category samples.

     Set this key’s value to true if the sample represents the start of a menstrual cycle; otherwise, set it to false.
     - Value type: ``Bool``
     - String value: `HKMenstrualCycleStart`
     - HealthKit Constant: ``HKMetadataKeyMenstrualCycleStart``
     */
    case menstrualCycleStart = "HKMenstrualCycleStart"

    /**
     - Value type: ``NSNumber``
     - String value: `HKPhysicalEffortEstimationType`
     - HealthKit Constant: ``HKMetadataKeyPhysicalEffortEstimationType``
     */
    @available(watchOS 10.0, iOS 17.0, macOS 14.0, *)
    case physicalEffortEstimationType = "HKPhysicalEffortEstimationType"

    /**
     Indicates the quantity was clamped to a lower bound.

     Value is a ``Bool`` indicating whether or not the quantity value in the sample has been clamped to some lower bound.
     - Value type: ``NSNumber``
     - String value: `HKMetadataKeyQuantityClampedToLowerBound`
     - HealthKit Constant: ``HKMetadataKeyQuantityClampedToLowerBound``
     */
    @available(iOS 16.0, macOS 13.0, watchOS 9.0, *)
    case quantityClampedToLowerBound = "HKMetadataKeyQuantityClampedToLowerBound"

    /**
     Indicates the quantity was clamped to an upper bound.

     Value is a ``Bool`` indicating whether or not the quantity value in the sample has been clamped to some upper bound.
     - Value type: ``Bool``
     - String value: `HKMetadataKeyQuantityClampedToUpperBound`
     - HealthKit Constant: ``HKMetadataKeyQuantityClampedToUpperBound``
     */
    @available(iOS 16.0, macOS 13.0, watchOS 9.0, *)
    case quantityClampedToUpperBound = "HKMetadataKeyQuantityClampedToUpperBound"

    /**
     A key that indicates the lower limit of the reference range for a lab result.

     This key takes an ``NSNumber`` value.
     - Value type: ``NSNumber``
     - String value: `HKReferenceRangeLowerLimit`
     - HealthKit Constant: ``HKMetadataKeyReferenceRangeLowerLimit``
     */
    case referenceRangeLowerLimit = "HKReferenceRangeLowerLimit"

    /**
     A key that indicates the upper limit of the reference range for a lab result.

     This key takes an ``NSNumber`` value.
     - Value type: ``NSNumber``
     - String value: `HKReferenceRangeUpperLimit`
     - HealthKit Constant: ``HKMetadataKeyReferenceRangeUpperLimit``
     */
    case referenceRangeUpperLimit = "HKReferenceRangeUpperLimit"

    /**
     - Value type: ``Quantity``, unit count/min
     - String value: `HKMetadataKeySessionEstimate`
     - HealthKit Constant: ``HKMetadataKeySessionEstimate``
     */
    @available(iOS 16.0, macOS 13.0, watchOS 9.0, *)
    case sessionEstimate = "HKMetadataKeySessionEstimate"

    /**
     - Value type: ``String``
     - String value: `sessionId`
     - HealthKit Constant: -
     */
    case sessionId = "sessionId"

    /**
     A key that indicates whether protection was used during sexual activity.
     This metadata key can be used with ``sexualActivity`` category samples.

     Set this key’s value to true if protection was used during sexual activity; otherwise, set it to false.
     - Value type: ``NSNumber``
     - String value: `HKSexualActivityProtectionUsed`
     - HealthKit Constant: ``HKMetadataKeySexualActivityProtectionUsed``
     */
    case sexualActivityProtectionUsed = "HKSexualActivityProtectionUsed"

    /**
     - Value type: ``NSNumber``
     - String value: `subIndex`
     - HealthKit Constant: -
     */
    case subIndex = "subIndex"

    /**
     - Value type: ``NSNumber``
     - String value: `HKSwimmingLocationType`
     - HealthKit Constant: ``HKMetadataKeySwimmingLocationType``
     */
    case swimmingLocationType = "HKSwimmingLocationType"

    /**
     - Value type: ``NSNumber`` (``HKSwimmingStrokeStyle``)
     - String value: `HKSwimmingStrokeStyle`
     - HealthKit Constant: ``HKMetadataKeySwimmingStrokeStyle``
     */
    case swimmingStrokeStyle = "HKSwimmingStrokeStyle"

    /**
     Represents sum of strokes per length and time for the length.
     Calculated for each lap event and segment event during swimming workout.

     The expected value type is an ``NSNumber`` containing a score.
     This key may be set on an ``HKWorkout`` object to represent the SWOLF Score during the whole workout.
     */
    case swoflScore = "HKSWOLFScore"

    /**
     A unique string that identifies a piece of data so it can be updated and synced.

     This key takes a string value.
     If you add this key to an object’s metadata, you must also add the ``HKMetadataKeySyncVersion`` key.

     When you save an ``HKObject`` with a sync identifier, the system looks for any existing objects with the same sync identifier.
     If it finds a match, the system compares the objects' ``HKMetadataKeySyncVersion`` values.
     If the new object has a greater sync version, the system replaces the old object with the new one.
     If the old object is associated with a workout or part of a correlation, the system also replaces the old object in the workout or correlation.
     - Value type: ``String``
     - String value: `HKCoachedWorkout`
     - HealthKit Constant: ``HKMetadataKeySyncIdentifier``
     */
    case syncIdentifier = "HKMetadataKeySyncIdentifier"

    /**
     The user’s time zone when the HealthKit object was created.
     
     This key takes a string value compatible with the ``NSTimeZone`` class’s ``timeZoneWithName:`` method.
     For best results when analyzing sleep samples, it's recommended that you store time zone metadata with your sleep sample data.
     - Value type: ``String``
     - String value: `HKTimeZone`
     - HealthKit Constant: ``HKMetadataKeyTimeZone``
     */
    case timeZone = "HKTimeZone"

    /**
     The device identifier portion of a device’s UDI (unique device identifier).

     The device identifier can be used to reference the GUDID (Globally Unique Device Identification Database).

     This key takes a string value.
     - Note: In iOS 9.0 and later, the use of this key is discouraged. Use the ``HKDevice`` class instead.

     - Value type: ``String``
     - String value: `HKUDIDeviceIdentifier`
     - HealthKit Constant: ``HKMetadataKeyUDIDeviceIdentifier``
     */
    case udiDeviceIdentifier = "HKUDIDeviceIdentifier"

    /**
     The production identifier portion of a device’s UDI (unique device identifier).

     Although the production identifier is part of a device's UDI, it is not saved in the FDA's GUDID (Globally Unique Device Identifier Database), and its use in HealthKit is now discouraged to protect user privacy.
     Apps that need this information should store it outside the HealthKit store.
     - Value type: ``String``
     - String value: `HKUDIProductionIdentifier`
     - HealthKit Constant: ``HKMetadataKeyUDIProductionIdentifier``
     */
    case udiProductionIdentifier = "HKUDIProductionIdentifier"

    /**
     - Value type: ``NSNumber``
     - String value: `HKMetadataKeyUserMotionContext`
     - HealthKit Constant: ``HKMetadataKeyUserMotionContext``
     */
    @available(iOS 16.0, macOS 13.0, watchOS 9.0, *)
    case userMotionContext = "HKMetadataKeyUserMotionContext"

    /**
     The method used to calculate the user’s VO2 max rate.

     This key takes an ``NSNumber`` object containing a ``HKVO2MaxTestType`` value.
     - Value type: ``NSNumber``
     - String value: `HKVO2MaxTestType`
     - HealthKit Constant: ``HKMetadataKeyVO2MaxTestType``
     */
    case vO2MaxTestType = "HKVO2MaxTestType"

    /**
     The maximum oxygen consumption rate during exercise of increasing intensity.

     The system sets this key on ``lowCardioFitnessEvent`` samples.
     It contains the value of the VO2 max measurement that triggered the event.
     The value of this key is an ``HKQuantity`` object with a unit of `ml/(kg*min)`.
     For more information on working with complex units, see [unitMultiplied(by:)](doc://com.apple.documentation/documentation/healthkit/hkunit/1615718-unitmultiplied), [unitDivided(by:)](doc://com.apple.documentation/documentation/healthkit/hkunit/1615242-unitdivided), and [init(from:)](doc://com.apple.documentation/documentation/healthkit/hkunit/1615733-init).
     - Value type: ``HKQuantity`` unit `ml/(kg*min)`
     - String value: `HKVO2MaxValue`
     - HealthKit Constant: ``HKMetadataKeyVO2MaxValue``
     */
    case vo2MaxValue = "HKVO2MaxValue"

    /**
     A key that indicates whether the sample was taken in a lab.

     Set this key’s value to true if the sample was taken by a lab; otherwise, set it to false.

     - Value type: ``Bool``
     - String value: `HKMetadataKeyWasTakenInLab`
     - HealthKit Constant: ``HKMetadataKeyWasTakenInLab``
     */
    case wasTakenInLab = "HKWasTakenInLab"

    /**
     A key that indicates whether the sample was entered by the user.

     Set this key’s value to true if the sample was entered by the user; otherwise, set it to false.

     - Value type: ``Bool`` (NSNumber?)
     - String value: `HKWasUserEntered`
     - HealthKit Constant: ``HKMetadataKeyWasUserEntered``
     */
    case wasUserEntered = "HKWasUserEntered"

    /**
     Represents the water salinity for an underwater depth or water temperature sample.

     The expected value type is an ``NSNumber`` containing a ``HKWaterSalinity`` value.
     - Value type: ``NSNumber``
     - String value: `HKMetadataKeyWaterSalinity`
     - HealthKit Constant: ``HKMetadataKeyWaterSalinity``
     */
    @available(macOS 14.0, iOS 17.0, watchOS 10.0, *)
    case waterSalinity = "HKMetadataKeyWaterSalinity"

    /**
     - Value type: ``Quantity``, unit %
     - String value: `HKWeatherHumidity`
     - HealthKit Constant: ``HKMetadataKeyWeatherHumidity``
     */
    case weatherHumidity = "HKWeatherHumidity"

    /**
     - Value type: ``Quantity``, unit degF
     - String value: `HKWeatherTemperature`
     - HealthKit Constant: ``HKMetadataKeyWeatherTemperature``
     */
    case weatherTemperature = "HKWeatherTemperature"

    /**
     The brand name of a particular workout.

     This key takes a string value.
     - Value type: ``String``
     - String value: `HKWorkoutBrandName`
     - HealthKit Constant: ``HKMetadataKeyWorkoutBrandName``
     */
    case workoutBrandName = "HKWorkoutBrandName"
}
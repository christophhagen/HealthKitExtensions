import Foundation
import HealthKit

extension HKQuantityTypeIdentifier:CaseIterable {

    /**
     All known quantity types for the targeted OS.
     */
    public static var allCases: [HKQuantityTypeIdentifier] {
        let baseTypes: [HKQuantityTypeIdentifier] = [
            .bodyFatPercentage,
            .bodyMass,
            .bodyMassIndex,
            .electrodermalActivity,
            .height,
            .leanBodyMass,
            .waistCircumference,
            .activeEnergyBurned,
            .appleExerciseTime,
            .appleMoveTime,
            .appleStandTime,
            .basalEnergyBurned,
            .distanceCycling,
            .distanceDownhillSnowSports,
            .distanceSwimming,
            .distanceWalkingRunning,
            .distanceWheelchair,
            .flightsClimbed,
            .nikeFuel,
            .pushCount,
            .stepCount,
            .swimmingStrokeCount,

            // Hearing Health
            .environmentalAudioExposure,
            .headphoneAudioExposure,

            // Heart
            .heartRate,
            .heartRateVariabilitySDNN,
            .peripheralPerfusionIndex,
            .restingHeartRate,
            .vo2Max,
            .walkingHeartRateAverage,

            // Mobility
            .appleWalkingSteadiness,
            .sixMinuteWalkTestDistance,
            .stairAscentSpeed,
            .stairDescentSpeed,
            .walkingAsymmetryPercentage,
            .walkingDoubleSupportPercentage,
            .walkingSpeed,
            .walkingStepLength,

            // Nutrition
            .dietaryBiotin,
            .dietaryCaffeine,
            .dietaryCalcium,
            .dietaryCarbohydrates,
            .dietaryChloride,
            .dietaryCholesterol,
            .dietaryChromium,
            .dietaryCopper,
            .dietaryEnergyConsumed,
            .dietaryFatMonounsaturated,
            .dietaryFatPolyunsaturated,
            .dietaryFatSaturated,
            .dietaryFatTotal,
            .dietaryFiber,
            .dietaryFolate,
            .dietaryIodine,
            .dietaryIron,
            .dietaryMagnesium,
            .dietaryManganese,
            .dietaryMolybdenum,
            .dietaryNiacin,
            .dietaryPantothenicAcid,
            .dietaryPhosphorus,
            .dietaryPotassium,
            .dietaryProtein,
            .dietaryRiboflavin,
            .dietarySelenium,
            .dietarySodium,
            .dietarySugar,
            .dietaryThiamin,
            .dietaryVitaminA,
            .dietaryVitaminB12,
            .dietaryVitaminB6,
            .dietaryVitaminC,
            .dietaryVitaminD,
            .dietaryVitaminE,
            .dietaryVitaminK,
            .dietaryWater,
            .dietaryZinc,

            // Other
            .bloodAlcoholContent,
            .bloodPressureDiastolic,
            .bloodPressureSystolic,
            .insulinDelivery,
            .numberOfAlcoholicBeverages,
            .numberOfTimesFallen,
            .uvExposure,

            // Reproductive Health
            .basalBodyTemperature,

            // Respiratory
            .forcedExpiratoryVolume1,
            .forcedVitalCapacity,
            .inhalerUsage,
            .oxygenSaturation,
            .peakExpiratoryFlowRate,
            .respiratoryRate,

            // Vital Signs
            .bloodGlucose,
            .bodyTemperature,
        ]
        guard #available(iOS 16.0, *) else {
            return baseTypes
        }
        let iOS16Types: [HKQuantityTypeIdentifier] = [
            .appleSleepingWristTemperature,
            .environmentalSoundReduction,
            .underwaterDepth,
            .runningPower,
            .runningSpeed,
            .atrialFibrillationBurden,
            .heartRateRecoveryOneMinute,
            .runningGroundContactTime,
            .runningStrideLength,
            .runningVerticalOscillation,
            .waterTemperature,
        ]
        guard #available(watchOS 10.0, macOS 14.0, iOS 17.0, *) else {
            return baseTypes + iOS16Types
        }
        return baseTypes + iOS16Types + [
            .timeInDaylight,
            .cyclingCadence,
            .cyclingFunctionalThresholdPower,
            .cyclingPower,
            .cyclingSpeed,
            .physicalEffort,
        ]
    }
}

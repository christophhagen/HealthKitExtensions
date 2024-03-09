import Foundation
import HealthKit

extension HKQuantityTypeIdentifier: CaseIterable {

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

extension HKQuantityTypeIdentifier: CustomStringConvertible {


    public var description: String {
        switch self {
        case .bodyFatPercentage: return "Body Fat Percentage"
        case .bodyMass: return "Body Mass"
        case .bodyMassIndex: return "Body Mass Index"
        case .electrodermalActivity: return "Electrodermal Activity"
        case .height: return "Height"
        case .leanBodyMass: return "Lean Body Mass"
        case .waistCircumference: return "Waist Circumference"
        case .activeEnergyBurned: return "Active Energy Burned"
        case .appleExerciseTime: return "Apple Exercise Time"
        case .appleMoveTime: return "Apple Move Time"
        case .appleStandTime: return "Apple Stand Time"
        case .basalEnergyBurned: return "Basal Energy Burned"
        case .distanceCycling: return "Cycling Distance"
        case .distanceDownhillSnowSports: return "Downhill Snow Sports Distance"
        case .distanceSwimming: return "Swimming Distance"
        case .distanceWalkingRunning: return "Walking/Running Distance"
        case .distanceWheelchair: return "Wheelchair Distance"
        case .flightsClimbed: return "Flights Climbed"
        case .nikeFuel: return "Nike Fuel"
        case .pushCount: return "Pushes"
        case .stepCount: return "Steps"
        case .swimmingStrokeCount: return "Swimming Strokes"

            // Hearing Health
        case .environmentalAudioExposure: return "Environmental Audio Exposure"
        case .headphoneAudioExposure: return "Headphone Audio Exposure"

            // Heart
        case .heartRate: return "Heart Rate"
        case .heartRateVariabilitySDNN: return "Heart Rate Variability SDNN"
        case .peripheralPerfusionIndex: return "Peripheral Perfusion Index"
        case .restingHeartRate: return "Resting Heart Rate"
        case .vo2Max: return "Vo2 Max"
        case .walkingHeartRateAverage: return "Average Walking Heart Rate"

            // Mobility
        case .appleWalkingSteadiness: return "Apple Walking Steadiness"
        case .sixMinuteWalkTestDistance: return "Six Minute Walk Test Distance"
        case .stairAscentSpeed: return "Stair Ascent Speed"
        case .stairDescentSpeed: return "Stair Descent Speed"
        case .walkingAsymmetryPercentage: return "Walking Asymmetry Percentage"
        case .walkingDoubleSupportPercentage: return "Walking Double Support Percentage"
        case .walkingSpeed: return "Walking Speed"
        case .walkingStepLength: return "Walking Step Length"

            // Nutrition
        case .dietaryBiotin: return "Dietary Biotin"
        case .dietaryCaffeine: return "Dietary Caffeine"
        case .dietaryCalcium: return "Dietary Calcium"
        case .dietaryCarbohydrates: return "Dietary Carbohydrates"
        case .dietaryChloride: return "Dietary Chloride"
        case .dietaryCholesterol: return "Dietary Cholesterol"
        case .dietaryChromium: return "Dietary Chromium"
        case .dietaryCopper: return "Dietary Copper"
        case .dietaryEnergyConsumed: return "Dietary EnergyConsumed"
        case .dietaryFatMonounsaturated: return "Dietary Monounsaturated Fat"
        case .dietaryFatPolyunsaturated: return "Dietary Polyunsaturated Fat"
        case .dietaryFatSaturated: return "Dietary Saturated Fat"
        case .dietaryFatTotal: return "Dietary Total Fat"
        case .dietaryFiber: return "Dietary Fiber"
        case .dietaryFolate: return "Dietary Folate"
        case .dietaryIodine: return "Dietary Iodine"
        case .dietaryIron: return "Dietary Iron"
        case .dietaryMagnesium: return "Dietary Magnesium"
        case .dietaryManganese: return "Dietary Manganese"
        case .dietaryMolybdenum: return "Dietary Molybdenum"
        case .dietaryNiacin: return "Dietary Niacin"
        case .dietaryPantothenicAcid: return "Dietary Pantothenic Acid"
        case .dietaryPhosphorus: return "Dietary Phosphorus"
        case .dietaryPotassium: return "Dietary Potassium"
        case .dietaryProtein: return "Dietary Protein"
        case .dietaryRiboflavin: return "Dietary Riboflavin"
        case .dietarySelenium: return "Dietary Selenium"
        case .dietarySodium: return "Dietary Sodium"
        case .dietarySugar: return "Dietary Sugar"
        case .dietaryThiamin: return "Dietary Thiamin"
        case .dietaryVitaminA: return "Dietary Vitamin A"
        case .dietaryVitaminB12: return "Dietary Vitamin B12"
        case .dietaryVitaminB6: return "Dietary Vitamin B6"
        case .dietaryVitaminC: return "Dietary Vitamin C"
        case .dietaryVitaminD: return "Dietary Vitamin D"
        case .dietaryVitaminE: return "Dietary Vitamin E"
        case .dietaryVitaminK: return "Dietary Vitamin K"
        case .dietaryWater: return "Dietary Water"
        case .dietaryZinc: return "Dietary Zinc"

            // Other
        case .bloodAlcoholContent: return "Blood Alcohol Content"
        case .bloodPressureDiastolic: return "Blood Pressure Diastolic"
        case .bloodPressureSystolic: return "Blood Pressure Systolic"
        case .insulinDelivery: return "Insulin Delivery"
        case .numberOfAlcoholicBeverages: return "Number Of Alcoholic Beverages"
        case .numberOfTimesFallen: return "Falls"
        case .uvExposure: return "UV Exposure"

            // Reproductive Health
        case .basalBodyTemperature: return "Basal Body Temperature"

            // Respiratory
        case .forcedExpiratoryVolume1: return "Forced Expiratory Volume 1"
        case .forcedVitalCapacity: return "Forced Vital Capacity"
        case .inhalerUsage: return "Inhaler Usage"
        case .oxygenSaturation: return "Oxygen Saturation"
        case .peakExpiratoryFlowRate: return "Peak Expiratory Flow Rate"
        case .respiratoryRate: return "Respiratory Rate"

            // Vital Signs
        case .bloodGlucose: return "Blood Glucose"
        case .bodyTemperature: return "Body Temperature"
        default: break
        }

        guard #available(iOS 16.0, *) else {
            return rawValue
        }
        switch self {
        case .appleSleepingWristTemperature: return "Apple Sleeping Wrist Temperature"
        case .environmentalSoundReduction: return "Environmental Sound Reduction"
        case .underwaterDepth: return "Underwater Depth"
        case .runningPower: return "Running Power"
        case .runningSpeed: return "Running Speed"
        case .atrialFibrillationBurden: return "Atrial Fibrillation Burden"
        case .heartRateRecoveryOneMinute: return "Heart Rate Recovery One Minute"
        case .runningGroundContactTime: return "Running Ground Contact Time"
        case .runningStrideLength: return "Running Stride Length"
        case .runningVerticalOscillation: return "Running Vertical Oscillation"
        case .waterTemperature: return "Water Temperature"
        default: break
        }
        guard #available(watchOS 10.0, macOS 14.0, iOS 17.0, *) else {
            return rawValue
        }
        switch self {
        case .timeInDaylight: return "Time In Daylight"
        case .cyclingCadence: return "Cycling Cadence"
        case .cyclingFunctionalThresholdPower: return "Cycling Functional Threshold Power"
        case .cyclingPower: return "Cycling Power"
        case .cyclingSpeed: return "Cycling Speed"
        case .physicalEffort: return "Physical Effort"
        default: return rawValue
        }
    }
}

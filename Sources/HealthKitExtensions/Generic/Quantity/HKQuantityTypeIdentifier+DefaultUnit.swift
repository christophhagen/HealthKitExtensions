import Foundation
import HealthKit

extension HKQuantityTypeIdentifier {

    /// The default unit associated with a quanity
    public var defaultUnit: HKUnit? {

        switch self {
        case .activeEnergyBurned: return ActiveEnergyBurned.defaultUnit
        case .bodyFatPercentage: return BodyFatPercentage.defaultUnit
        case .bodyMass: return BodyMass.defaultUnit
        case .bodyMassIndex: return BodyMassIndex.defaultUnit
        case .electrodermalActivity: return ElectrodermalActivity.defaultUnit
        case .height: return Height.defaultUnit
        case .leanBodyMass: return LeanBodyMass.defaultUnit
        case .waistCircumference: return WaistCircumference.defaultUnit
        case .activeEnergyBurned: return ActiveEnergyBurned.defaultUnit
        case .appleExerciseTime: return AppleExerciseTime.defaultUnit
        case .appleMoveTime: return AppleMoveTime.defaultUnit
        case .appleStandTime: return AppleStandTime.defaultUnit
        case .basalEnergyBurned: return BasalEnergyBurned.defaultUnit
        case .distanceCycling: return DistanceCycling.defaultUnit
        case .distanceDownhillSnowSports: return DistanceDownhillSnowSports.defaultUnit
        case .distanceSwimming: return DistanceSwimming.defaultUnit
        case .distanceWalkingRunning: return DistanceWalkingRunning.defaultUnit
        case .distanceWheelchair: return DistanceWheelchair.defaultUnit
        case .flightsClimbed: return FlightsClimbed.defaultUnit
        case .nikeFuel: return NikeFuel.defaultUnit
        case .pushCount: return PushCount.defaultUnit
        case .stepCount: return StepCount.defaultUnit
        case .swimmingStrokeCount: return SwimmingStrokeCount.defaultUnit
        case .environmentalAudioExposure: return EnvironmentalAudioExposure.defaultUnit
        case .headphoneAudioExposure: return HeadphoneAudioExposure.defaultUnit
        case .heartRate: return HeartRate.defaultUnit
        case .heartRateVariabilitySDNN: return HeartRateVariabilitySDNN.defaultUnit
        case .peripheralPerfusionIndex: return PeripheralPerfusionIndex.defaultUnit
        case .restingHeartRate: return RestingHeartRate.defaultUnit
        case .vo2Max: return Vo2Max.defaultUnit
        case .walkingHeartRateAverage: return WalkingHeartRateAverage.defaultUnit
        case .appleWalkingSteadiness: return AppleWalkingSteadiness.defaultUnit
        case .sixMinuteWalkTestDistance: return SixMinuteWalkTestDistance.defaultUnit
        case .stairAscentSpeed: return StairAscentSpeed.defaultUnit
        case .stairDescentSpeed: return StairDescentSpeed.defaultUnit
        case .walkingAsymmetryPercentage: return WalkingAsymmetryPercentage.defaultUnit
        case .walkingDoubleSupportPercentage: return WalkingDoubleSupportPercentage.defaultUnit
        case .walkingSpeed: return WalkingSpeed.defaultUnit
        case .walkingStepLength: return WalkingStepLength.defaultUnit
        case .dietaryBiotin: return DietaryBiotin.defaultUnit
        case .dietaryCaffeine: return DietaryCaffeine.defaultUnit
        case .dietaryCalcium: return DietaryCalcium.defaultUnit
        case .dietaryCarbohydrates: return DietaryCarbohydrates.defaultUnit
        case .dietaryChloride: return DietaryChloride.defaultUnit
        case .dietaryCholesterol: return DietaryCholesterol.defaultUnit
        case .dietaryChromium: return DietaryChromium.defaultUnit
        case .dietaryCopper: return DietaryCopper.defaultUnit
        case .dietaryEnergyConsumed: return DietaryEnergyConsumed.defaultUnit
        case .dietaryFatMonounsaturated: return DietaryFatMonounsaturated.defaultUnit
        case .dietaryFatPolyunsaturated: return DietaryFatPolyunsaturated.defaultUnit
        case .dietaryFatSaturated: return DietaryFatSaturated.defaultUnit
        case .dietaryFatTotal: return DietaryFatTotal.defaultUnit
        case .dietaryFiber: return DietaryFiber.defaultUnit
        case .dietaryFolate: return DietaryFolate.defaultUnit
        case .dietaryIodine: return DietaryIodine.defaultUnit
        case .dietaryIron: return DietaryIron.defaultUnit
        case .dietaryMagnesium: return DietaryMagnesium.defaultUnit
        case .dietaryManganese: return DietaryManganese.defaultUnit
        case .dietaryMolybdenum: return DietaryMolybdenum.defaultUnit
        case .dietaryNiacin: return DietaryNiacin.defaultUnit
        case .dietaryPantothenicAcid: return DietaryPantothenicAcid.defaultUnit
        case .dietaryPhosphorus: return DietaryPhosphorus.defaultUnit
        case .dietaryPotassium: return DietaryPotassium.defaultUnit
        case .dietaryProtein: return DietaryProtein.defaultUnit
        case .dietaryRiboflavin: return DietaryRiboflavin.defaultUnit
        case .dietarySelenium: return DietarySelenium.defaultUnit
        case .dietarySodium: return DietarySodium.defaultUnit
        case .dietarySugar: return DietarySugar.defaultUnit
        case .dietaryThiamin: return DietaryThiamin.defaultUnit
        case .dietaryVitaminA: return DietaryVitaminA.defaultUnit
        case .dietaryVitaminB12: return DietaryVitaminB12.defaultUnit
        case .dietaryVitaminB6: return DietaryVitaminB6.defaultUnit
        case .dietaryVitaminC: return DietaryVitaminC.defaultUnit
        case .dietaryVitaminD: return DietaryVitaminD.defaultUnit
        case .dietaryVitaminE: return DietaryVitaminE.defaultUnit
        case .dietaryVitaminK: return DietaryVitaminK.defaultUnit
        case .dietaryWater: return DietaryWater.defaultUnit
        case .dietaryZinc: return DietaryZinc.defaultUnit
        case .bloodAlcoholContent: return BloodAlcoholContent.defaultUnit
        case .bloodPressureDiastolic: return BloodPressureDiastolic.defaultUnit
        case .bloodPressureSystolic: return BloodPressureSystolic.defaultUnit
        case .insulinDelivery: return InsulinDelivery.defaultUnit
        case .numberOfAlcoholicBeverages: return NumberOfAlcoholicBeverages.defaultUnit
        case .numberOfTimesFallen: return NumberOfTimesFallen.defaultUnit
        case .uvExposure: return UvExposure.defaultUnit
        case .basalBodyTemperature: return BasalBodyTemperature.defaultUnit
        case .forcedExpiratoryVolume1: return ForcedExpiratoryVolume1.defaultUnit
        case .forcedVitalCapacity: return ForcedVitalCapacity.defaultUnit
        case .inhalerUsage: return InhalerUsage.defaultUnit
        case .oxygenSaturation: return OxygenSaturation.defaultUnit
        case .peakExpiratoryFlowRate: return PeakExpiratoryFlowRate.defaultUnit
        case .respiratoryRate: return RespiratoryRate.defaultUnit
        case .bloodGlucose: return BloodGlucose.defaultUnit
        case .bodyTemperature: return BodyTemperature.defaultUnit
        default:
            break
        }

        guard #available(watchOS 10.0, macOS 14.0, iOS 16.0, *) else {
            return nil
        }

        switch self {
        case .appleSleepingWristTemperature: return AppleSleepingWristTemperature.defaultUnit
        case .runningPower: return RunningPower.defaultUnit
        case .runningSpeed: return RunningSpeed.defaultUnit
        case .underwaterDepth: return UnderwaterDepth.defaultUnit
        case .environmentalSoundReduction: return EnvironmentalSoundReduction.defaultUnit
        case .atrialFibrillationBurden: return AtrialFibrillationBurden.defaultUnit
        case .heartRateRecoveryOneMinute: return HeartRateRecoveryOneMinute.defaultUnit
        case .runningGroundContactTime: return RunningGroundContactTime.defaultUnit
        case .runningStrideLength: return RunningStrideLength.defaultUnit
        case .runningVerticalOscillation: return RunningVerticalOscillation.defaultUnit
        case .waterTemperature: return WaterTemperature.defaultUnit
        default:
            break
        }

        guard #available(iOS 17.0, *) else {
            return nil
        }
        
        switch self {
        case .cyclingCadence: return CyclingCadence.defaultUnit
        case .cyclingFunctionalThresholdPower: return CyclingFunctionalThresholdPower.defaultUnit
        case .cyclingPower: return CyclingPower.defaultUnit
        case .cyclingSpeed: return CyclingSpeed.defaultUnit
        case .physicalEffort: return PhysicalEffort.defaultUnit
        case .timeInDaylight: return TimeInDaylight.defaultUnit
        default:
            break
        }

        return nil
    }
}

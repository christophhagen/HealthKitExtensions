import Foundation
import HealthKit

extension HKQuantityType {

    private static var justReadableTypesPriorIOS16: [HKQuantitySampleContainer.Type] {
        [
            AppleMoveTime.self,
            AppleStandTime.self,
            NikeFuel.self,
            WalkingHeartRateAverage.self,
            AppleWalkingSteadiness.self,
            WalkingAsymmetryPercentage.self
        ]
    }

    @available(iOS 16.0, watchOS 9.0, *)
    private static var justReadableTypesAddedIOS16: [HKQuantitySampleContainer.Type] {
        [
            AppleSleepingWristTemperature.self,
            AtrialFibrillationBurden.self,
        ]
    }

    private static var justReadableTypes: [HKQuantitySampleContainer.Type] {
        guard #available(iOS 16.0, watchOS 9.0, *) else {
            return justReadableTypesPriorIOS16
        }
        return justReadableTypesPriorIOS16 + justReadableTypesAddedIOS16
    }

    private static var readWriteTypesPriorIOS16: [HKQuantitySampleContainer.Type] {
        [
            BodyFatPercentage.self,
            BodyMass.self,
            BodyMassIndex.self,
            ElectrodermalActivity.self,
            Height.self,
            LeanBodyMass.self,
            WaistCircumference.self,

            // Fitness
            ActiveEnergyBurned.self,
            AppleExerciseTime.self,
            BasalEnergyBurned.self,
            DistanceCycling.self,
            DistanceDownhillSnowSports.self,
            DistanceSwimming.self,
            DistanceWalkingRunning.self,
            DistanceWheelchair.self,
            FlightsClimbed.self,
            PushCount.self,
            StepCount.self,
            SwimmingStrokeCount.self,

            // Hearing Health
            EnvironmentalAudioExposure.self,
            HeadphoneAudioExposure.self,

            // Heart
            HeartRate.self,
            HeartRateVariabilitySDNN.self,
            PeripheralPerfusionIndex.self,
            RestingHeartRate.self,
            Vo2Max.self,

            // Mobility
            SixMinuteWalkTestDistance.self,
            StairAscentSpeed.self,
            StairDescentSpeed.self,
            WalkingDoubleSupportPercentage.self,
            WalkingSpeed.self,
            WalkingStepLength.self,

            // Nutrition
            DietaryBiotin.self,
            DietaryCaffeine.self,
            DietaryCalcium.self,
            DietaryCarbohydrates.self,
            DietaryChloride.self,
            DietaryCholesterol.self,
            DietaryChromium.self,
            DietaryCopper.self,
            DietaryEnergyConsumed.self,
            DietaryFatMonounsaturated.self,
            DietaryFatPolyunsaturated.self,
            DietaryFatSaturated.self,
            DietaryFatTotal.self,
            DietaryFiber.self,
            DietaryFolate.self,
            DietaryIodine.self,
            DietaryIron.self,
            DietaryMagnesium.self,
            DietaryManganese.self,
            DietaryMolybdenum.self,
            DietaryNiacin.self,
            DietaryPantothenicAcid.self,
            DietaryPhosphorus.self,
            DietaryPotassium.self,
            DietaryProtein.self,
            DietaryRiboflavin.self,
            DietarySelenium.self,
            DietarySodium.self,
            DietarySugar.self,
            DietaryThiamin.self,
            DietaryVitaminA.self,
            DietaryVitaminB12.self,
            DietaryVitaminB6.self,
            DietaryVitaminC.self,
            DietaryVitaminD.self,
            DietaryVitaminE.self,
            DietaryVitaminK.self,
            DietaryWater.self,
            DietaryZinc.self,

            // Other
            BloodAlcoholContent.self,
            BloodPressureDiastolic.self,
            BloodPressureSystolic.self,
            InsulinDelivery.self,
            NumberOfAlcoholicBeverages.self,
            NumberOfTimesFallen.self,
            UvExposure.self,

            // Reproductive Health
            BasalBodyTemperature.self,

            // Respiratory
            ForcedExpiratoryVolume1.self,
            ForcedVitalCapacity.self,
            InhalerUsage.self,
            OxygenSaturation.self,
            PeakExpiratoryFlowRate.self,
            RespiratoryRate.self,

            // Vital Signs
            BloodGlucose.self,
            BodyTemperature.self
        ]
    }

    @available(iOS 16.0, watchOS 9.0, *)
    private static var readWriteTypesAddedIOS16: [HKQuantitySampleContainer.Type] {
        [
            RunningPower.self,
            RunningSpeed.self,
            UnderwaterDepth.self,
            EnvironmentalSoundReduction.self,
            HeartRateRecoveryOneMinute.self,
            RunningGroundContactTime.self,
            RunningStrideLength.self,
            RunningVerticalOscillation.self,
            WaterTemperature.self,

        ]
    }

    @available(iOS 17.0, watchOS 10.0, macOS 14.0, *)
    private static var readWriteTypesAddedIOS17: [HKQuantitySampleContainer.Type] {
        [
            CyclingCadence.self,
            CyclingFunctionalThresholdPower.self,
            CyclingPower.self,
            CyclingSpeed.self,
            PhysicalEffort.self,
            TimeInDaylight.self,
        ]
    }

    public static var writableTypes: [HKQuantitySampleContainer.Type] {
        guard #available(iOS 16.0, watchOS 9.0, *) else {
            return readWriteTypesPriorIOS16
        }
        guard #available(iOS 17.0, watchOS 10.0, macOS 14.0, *) else {
            return readWriteTypesPriorIOS16 + readWriteTypesAddedIOS16
        }
        return readWriteTypesPriorIOS16 + readWriteTypesAddedIOS16 + readWriteTypesAddedIOS17
    }

    public static var readableTypes: [HKQuantitySampleContainer.Type] {
        writableTypes + justReadableTypes
    }
}

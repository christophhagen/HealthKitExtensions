import Foundation
import HealthKit

extension HKCategoryType {

    private static var justReadableTypesPriorIOS16: [HKSampleContainer.Type] {
        [
            AppleStandHour.self,
            // Hearing Health
            EnvironmentalAudioExposureEvent.self,
            HeadphoneAudioExposureEvent.self,
            // Heart
            HighHeartRateEvent.self,
            IrregularHeartRhythmEvent.self,
            LowCardioFitnessEvent.self,
            LowHeartRateEvent.self,
            // Mobility
            AppleWalkingSteadinessEvent.self,
        ]
    }

    @available(iOS 16.0, watchOS 9.0, *)
    private static var justReadableTypesIOS16: [HKSampleContainer.Type] {
        [
            InfrequentMenstrualCycles.self,
            IrregularMenstrualCycles.self,
            PersistentIntermenstrualBleeding.self,
            ProlongedMenstrualPeriods.self,
        ]
    }

    private static var justReadableTypes: [HKSampleContainer.Type] {
        if #available(iOS 16.0, watchOS 9.0, *) {
            return justReadableTypesPriorIOS16 + justReadableTypesIOS16
        } else {
            return justReadableTypesPriorIOS16
        }
    }

    public static var writableTypes: [HKSampleContainer.Type] {
        [
            // Mindfulness
            MindfulSession.self,

            // Other
            HandwashingEvent.self,
            ToothbrushingEvent.self,

            // Reproductive Health
            CervicalMucusQuality.self,
            Contraceptive.self,
            IntermenstrualBleeding.self,

            Lactation.self,
            MenstrualFlow.self,
            OvulationTestResult.self,

            Pregnancy.self,
            PregnancyTestResult.self,
            ProgesteroneTestResult.self,
            SexualActivity.self,

            // Respiratory

            // Sleep
            SleepAnalysis.self,

            // Symptoms
            AbdominalCramps.self,
            Acne.self,
            AppetiteChanges.self,
            BladderIncontinence.self,
            Bloating.self,
            BreastPain.self,
            ChestTightnessOrPain.self,
            Chills.self,
            Constipation.self,
            Coughing.self,
            Diarrhea.self,
            Dizziness.self,
            DrySkin.self,
            Fainting.self,
            Fatigue.self,
            Fever.self,
            GeneralizedBodyAche.self,
            HairLoss.self,
            Headache.self,
            Heartburn.self,
            HotFlashes.self,
            LossOfSmell.self,
            LossOfTaste.self,
            LowerBackPain.self,
            MemoryLapse.self,
            MoodChanges.self,
            Nausea.self,
            NightSweats.self,
            PelvicPain.self,
            RapidPoundingOrFlutteringHeartbeat.self,
            RunnyNose.self,
            ShortnessOfBreath.self,
            SinusCongestion.self,
            SkippedHeartbeat.self,
            SleepChanges.self,
            SoreThroat.self,
            VaginalDryness.self,
            Vomiting.self,
            Wheezing.self
        ]
    }

    public static var readableTypes: [HKSampleContainer.Type] {
        writableTypes + justReadableTypes
    }
}

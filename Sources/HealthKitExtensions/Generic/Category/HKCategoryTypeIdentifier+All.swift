import Foundation
import HealthKit

extension HKCategoryTypeIdentifier: CaseIterable {

    /**
     All known category types for the targeted OS.
     */
    public static var allCases: [HKCategoryTypeIdentifier] {
        let baseTypes: [HKCategoryTypeIdentifier] = [
            .appleStandHour,

            // Hearing Health
            .environmentalAudioExposureEvent,
            .headphoneAudioExposureEvent,

            // Heart
            .highHeartRateEvent,
            .irregularHeartRhythmEvent,
            .lowCardioFitnessEvent,
            .lowHeartRateEvent,

            // Mindfulness
            .mindfulSession,

            // Mobility
            .appleWalkingSteadinessEvent,

            // Other
            .handwashingEvent,
            .toothbrushingEvent,

            // Reproductive Health
            .cervicalMucusQuality,
            .contraceptive,
            .intermenstrualBleeding,
            .lactation,
            .menstrualFlow,
            .ovulationTestResult,
            .pregnancy,
            .pregnancyTestResult,
            .progesteroneTestResult,
            .sexualActivity,

            // Respiratory

            // Sleep
                .sleepAnalysis,

            // Symptoms
            .abdominalCramps,
            .acne,
            .appetiteChanges,
            .bladderIncontinence,
            .bloating,
            .breastPain,
            .chestTightnessOrPain,
            .chills,
            .constipation,
            .coughing,
            .diarrhea,
            .dizziness,
            .drySkin,
            .fainting,
            .fatigue,
            .fever,
            .generalizedBodyAche,
            .hairLoss,
            .headache,
            .heartburn,
            .hotFlashes,
            .lossOfSmell,
            .lossOfTaste,
            .lowerBackPain,
            .memoryLapse,
            .moodChanges,
            .nausea,
            .nightSweats,
            .pelvicPain,
            .rapidPoundingOrFlutteringHeartbeat,
            .runnyNose,
            .shortnessOfBreath,
            .sinusCongestion,
            .skippedHeartbeat,
            .sleepChanges,
            .soreThroat,
            .vaginalDryness,
            .vomiting,
            .wheezing,
        ]
        guard #available(iOS 16.0, *) else {
            return baseTypes
        }
        return baseTypes + [
            .infrequentMenstrualCycles,
            .irregularMenstrualCycles,
            .persistentIntermenstrualBleeding,
            .prolongedMenstrualPeriods,
        ]
    }
}

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

extension HKCategoryTypeIdentifier: CustomStringConvertible {

    public var description: String {
        if #available(iOS 16.0, *) {
            switch self {
            case .infrequentMenstrualCycles: return "Infrequent Menstrual Cycles"
            case .irregularMenstrualCycles: return "Irregular Menstrual Cycles"
            case .persistentIntermenstrualBleeding: return "Persistent Intermenstrual Bleeding"
            case .prolongedMenstrualPeriods: return "Prolonged Menstrual Periods"
            default:
                break
            }
        }
        switch self {
        case .appleStandHour: return "Apple Stand Hour"

            // Hearing Health
        case .environmentalAudioExposureEvent: return "Environmental Audio Exposure Event"
        case .headphoneAudioExposureEvent: return "Headphone Audio Exposure Event"

            // Heart
        case .highHeartRateEvent: return "High Heart Rate Event"
        case .irregularHeartRhythmEvent: return "Irregular Heart Rhythm Event"
        case .lowCardioFitnessEvent: return "Low Cardio Fitness Event"
        case .lowHeartRateEvent: return "Low Heart Rate Event"

            // Mindfulness
        case .mindfulSession: return "Mindful Session"

            // Mobility
        case .appleWalkingSteadinessEvent: return "Apple Walking Steadiness Event"

            // Other
        case .handwashingEvent: return "Handwashing Event"
        case .toothbrushingEvent: return "Toothbrushing Event"

            // Reproductive Health
        case .cervicalMucusQuality: return "Cervical Mucus Quality"
        case .contraceptive: return "Contraceptive"
        case .intermenstrualBleeding: return "Intermenstrual Bleeding"
        case .lactation: return "Lactation"
        case .menstrualFlow: return "Menstrual Flow"
        case .ovulationTestResult: return "Ovulation Test Result"
        case .pregnancy: return "Pregnancy"
        case .pregnancyTestResult: return "Pregnancy Test Result"
        case .progesteroneTestResult: return "Progesterone Test Result"
        case .sexualActivity: return "Sexual Activity"

            // Respiratory

            // Sleep
        case     .sleepAnalysis: return "Sleep Analysis"

            // Symptoms
        case .abdominalCramps: return "Abdominal Cramps"
        case .acne: return "Acne"
        case .appetiteChanges: return "Appetite Changes"
        case .bladderIncontinence: return "Bladder Incontinence"
        case .bloating: return "Bloating"
        case .breastPain: return "Breast Pain"
        case .chestTightnessOrPain: return "Chest Tightness Or Pain"
        case .chills: return "Chills"
        case .constipation: return "Constipation"
        case .coughing: return "Coughing"
        case .diarrhea: return "Diarrhea"
        case .dizziness: return "Dizziness"
        case .drySkin: return "DrySkin"
        case .fainting: return "Fainting"
        case .fatigue: return "Fatigue"
        case .fever: return "Fever"
        case .generalizedBodyAche: return "Generalized Body Ache"
        case .hairLoss: return "Hair Loss"
        case .headache: return "Headache"
        case .heartburn: return "Heartburn"
        case .hotFlashes: return "Hot Flashes"
        case .lossOfSmell: return "Loss Of Smell"
        case .lossOfTaste: return "Loss Of Taste"
        case .lowerBackPain: return "Lower Back Pain"
        case .memoryLapse: return "Memory Lapse"
        case .moodChanges: return "Mood Changes"
        case .nausea: return "Nausea"
        case .nightSweats: return "Night Sweats"
        case .pelvicPain: return "Pelvic Pain"
        case .rapidPoundingOrFlutteringHeartbeat: return "Rapid Pounding Or Fluttering Heartbeat"
        case .runnyNose: return "Runny Nose"
        case .shortnessOfBreath: return "Shortness Of Breath"
        case .sinusCongestion: return "Sinus Congestion"
        case .skippedHeartbeat: return "Skipped Heartbeat"
        case .sleepChanges: return "Sleep Changes"
        case .soreThroat: return "Sore Throat"
        case .vaginalDryness: return "Vaginal Dryness"
        case .vomiting: return "Vomiting"
        case .wheezing: return "Wheezing"
        default: return self.rawValue
        }
    }
}

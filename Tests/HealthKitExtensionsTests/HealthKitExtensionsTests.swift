import XCTest
import HealthKit
@testable import HealthKitExtensions

final class HealthKitExtensionsTests: XCTestCase {

    let now = Date.now

    @available(iOS 16.0, watchOS 9.0, *)
    func testAllTypes() async throws {
        let categorySamples: [HKCategorySampleContainer] = [
            AppleStandHour(value: .stood, start: now, end: now),
            EnvironmentalAudioExposureEvent(value: .momentaryLimit, start: now, end: now),
            HeadphoneAudioExposureEvent(value: .sevenDayLimit, start: now, end: now),
            HighHeartRateEvent(heartRateEventThreshold: 180.0, start: now, end: now),
            IrregularHeartRhythmEvent(start: now, end: now),
            LowCardioFitnessEvent(value: .lowFitness, start: now, end: now),
            LowHeartRateEvent(start: now, end: now),
            MindfulSession(start: now, end: now),
            AppleWalkingSteadinessEvent(value: .repeatLow, start: now, end: now),
            HandwashingEvent(start: now, end: now),
            ToothbrushingEvent(start: now, end: now),
            CervicalMucusQuality(value: .creamy, start: now, end: now),
            Contraceptive(value: .implant, start: now, end: now),
            InfrequentMenstrualCycles(start: now, end: now),
            IntermenstrualBleeding(start: now, end: now),
            Lactation(start: now, end: now),
            MenstrualFlow(value: .heavy, cycleStart: true, start: now, end: now),
            OvulationTestResult(value: .negative, start: now, end: now),
            PersistentIntermenstrualBleeding(start: now, end: now),
            Pregnancy(start: now, end: now),
            PregnancyTestResult(value: .positive, start: now, end: now),
            ProlongedMenstrualPeriods(start: now, end: now),
            SexualActivity(protectionUsed: true, start: now, end: now),
            SleepAnalysis(value: .asleepREM, start: now, end: now),
            AbdominalCramps(value: .moderate, start: now, end: now),
            Acne(value: .moderate, start: now, end: now),
            AppetiteChanges(value: .decreased, start: now, end: now),
            BladderIncontinence(value: .moderate, start: now, end: now),
            Bloating(value: .moderate, start: now, end: now),
            BreastPain(value: .moderate, start: now, end: now),
            ChestTightnessOrPain(value: .moderate, start: now, end: now),
            Chills(value: .moderate, start: now, end: now),
            Constipation(value: .moderate, start: now, end: now),
            Coughing(value: .moderate, start: now, end: now),
            Diarrhea(value: .moderate, start: now, end: now),
            Dizziness(value: .moderate, start: now, end: now),
            DrySkin(value: .moderate, start: now, end: now),
            Fainting(value: .moderate, start: now, end: now),
            Fatigue(value: .moderate, start: now, end: now),
            Fever(value: .moderate, start: now, end: now),
            GeneralizedBodyAche(value: .moderate, start: now, end: now),
            HairLoss(value: .moderate, start: now, end: now),
            Headache(value: .moderate, start: now, end: now),
            Heartburn(value: .moderate, start: now, end: now),
            HotFlashes(value: .moderate, start: now, end: now),
            LossOfSmell(value: .moderate, start: now, end: now),
            LossOfTaste(value: .moderate, start: now, end: now),
            LowerBackPain(value: .moderate, start: now, end: now),
            MemoryLapse(value: .moderate, start: now, end: now),
            MoodChanges(value: .present, start: now, end: now),
            Nausea(value: .moderate, start: now, end: now),
            NightSweats(value: .moderate, start: now, end: now),
            PelvicPain(value: .moderate, start: now, end: now),
            RapidPoundingOrFlutteringHeartbeat(value: .moderate, start: now, end: now),
            RunnyNose(value: .moderate, start: now, end: now),
            ShortnessOfBreath(value: .moderate, start: now, end: now),
            SinusCongestion(value: .moderate, start: now, end: now),
            SkippedHeartbeat(value: .moderate, start: now, end: now),
            SleepChanges(value: .present, start: now, end: now),
            SoreThroat(value: .moderate, start: now, end: now),
            VaginalDryness(value: .moderate, start: now, end: now),
            Vomiting(value: .moderate, start: now, end: now),
            Wheezing(value: .moderate, start: now, end: now),
        ]

        let store = HKHealthStore()

        try await store.requestAuthorization(toShare: [Wheezing.self], read: [SleepChanges.self])
        try await store.requestAuthorization(
            toShare: Vomiting.self, SoreThroat.self,
            read: SkippedHeartbeat.self, SleepChanges.self)

        try await store.save(categorySamples)
    }

    func testExternalUUID() throws {

        let uuid = UUID()

        let sample = Wheezing(value: .moderate, start: now, end: now, uuid: uuid)

        // Assigned UUID should be different
        XCTAssertNotEqual(sample.uuid, uuid)

        // The preferred UUID should be the one set
        XCTAssertEqual(sample.preferredUUID, uuid)

        // A metadata key should be set
        XCTAssertEqual(sample.metadata?.count ?? 0, 1)

        // The clean metadata should not contain any values
        XCTAssertEqual(sample.cleanMetadata.count, 0)
    }

    func testMetadataSubscript() {

        var metadata = Metadata()
        metadata[.menstrualCycleStart] = true

        let cycleStart: Bool? = metadata[.menstrualCycleStart]
        XCTAssertEqual(cycleStart, true)

        if let start: Bool = metadata[.menstrualCycleStart] {
            XCTAssertEqual(start, true)
        } else {
            XCTFail()
        }
    }

    @available(iOS 16.0, watchOS 9.0, *)
    func testQuantities() {
        let temperature = 36.0 // °C

        let sample = AppleSleepingWristTemperature(value: temperature, start: now, end: now)
        let sample2 = AppleSleepingWristTemperature(quantity: .init(unit: .degreeFahrenheit(), doubleValue: 96.8), start: now, end: now, uuid: .init())

        XCTAssertLessThan(abs(sample.value - sample2.value), 0.001)
    }

    @available(iOS 17.0, macOS 14.0, watchOS 10.0, *)
    func makeAllQuantities() {
        let _: [HKQuantitySampleContainer] = [
            // Body
            AppleSleepingWristTemperature(value: 37.0, start: now, end: now),
            BodyFatPercentage(value: 10.0, start: now, end: now),
            BodyMass(value: 80.0, start: now, end: now),
            BodyMassIndex(value: 25.0, start: now, end: now),
            ElectrodermalActivity(value: 6.0, start: now, end: now),
            Height(value: 1.80, start: now, end: now),
            LeanBodyMass(value: 65.0, start: now, end: now),
            WaistCircumference(value: 1.0, start: now, end: now),
            // Fitness
            ActiveEnergyBurned(value: 1.0, start: now, end: now),
            AppleExerciseTime(value: 1.0, start: now, end: now),
            AppleMoveTime(value: 1.0, start: now, end: now),
            AppleStandTime(value: 1.0, start: now, end: now),
            BasalEnergyBurned(value: 1.0, start: now, end: now),
            CyclingCadence(value: 1.0, start: now, end: now),
            CyclingFunctionalThresholdPower(value: 1.0, start: now, end: now),
            CyclingPower(value: 1.0, start: now, end: now),
            CyclingSpeed(value: 1.0, start: now, end: now),
            DistanceCycling(value: 1.0, start: now, end: now),
            DistanceDownhillSnowSports(value: 1.0, start: now, end: now),
            DistanceSwimming(value: 1.0, start: now, end: now),
            DistanceWalkingRunning(value: 1.0, start: now, end: now),
            DistanceWheelchair(value: 1.0, start: now, end: now),
            FlightsClimbed(value: 1.0, start: now, end: now),
            NikeFuel(value: 1.0, start: now, end: now),
            PhysicalEffort(value: 1.0, start: now, end: now),
            PushCount(value: 1.0, start: now, end: now),
            RunningPower(value: 1.0, start: now, end: now),
            RunningSpeed(value: 1.0, start: now, end: now),
            StepCount(value: 1.0, start: now, end: now),
            SwimmingStrokeCount(value: 1.0, start: now, end: now),
            UnderwaterDepth(value: 1.0, start: now, end: now),
            // Hearing Health
            EnvironmentalAudioExposure(value: 1.0, start: now, end: now),
            EnvironmentalSoundReduction(value: 1.0, start: now, end: now),
            HeadphoneAudioExposure(value: 1.0, start: now, end: now),
            // Heart
            AtrialFibrillationBurden(value: 1.0, start: now, end: now),
            HeartRate(countsPerSecond: 1.0, motionContext: .sedentary, start: now, end: now),
            HeartRateRecoveryOneMinute(value: 1.0, start: now, end: now),
            HeartRateVariabilitySDNN(value: 1.0, start: now, end: now),
            PeripheralPerfusionIndex(value: 1.0, start: now, end: now),
            RestingHeartRate(value: 1.0, start: now, end: now),
            Vo2Max(value: 1.0, testType: .maxExercise, start: now, end: now),
            WalkingHeartRateAverage(value: 1.0, start: now, end: now),
            // Mobility
            AppleWalkingSteadiness(value: 1.0, start: now, end: now),
            RunningGroundContactTime(value: 1.0, start: now, end: now),
            RunningStrideLength(value: 1.0, start: now, end: now),
            RunningVerticalOscillation(value: 1.0, start: now, end: now),
            SixMinuteWalkTestDistance(value: 1.0, start: now, end: now),
            StairAscentSpeed(value: 1.0, start: now, end: now),
            StairDescentSpeed(value: 1.0, start: now, end: now),
            WalkingAsymmetryPercentage(value: 1.0, start: now, end: now),
            WalkingDoubleSupportPercentage(value: 1.0, start: now, end: now),
            WalkingSpeed(value: 1.0, start: now, end: now),
            WalkingStepLength(value: 1.0, start: now, end: now),
            // Nutrition
            DietaryBiotin(value: 1.0, start: now, end: now),
            DietaryCaffeine(value: 1.0, start: now, end: now),
            DietaryCalcium(value: 1.0, start: now, end: now),
            DietaryCarbohydrates(value: 1.0, start: now, end: now),
            DietaryChloride(value: 1.0, start: now, end: now),
            DietaryCholesterol(value: 1.0, start: now, end: now),
            DietaryChromium(value: 1.0, start: now, end: now),
            DietaryCopper(value: 1.0, start: now, end: now),
            DietaryEnergyConsumed(value: 1.0, start: now, end: now),
            DietaryFatMonounsaturated(value: 1.0, start: now, end: now),
            DietaryFatPolyunsaturated(value: 1.0, start: now, end: now),
            DietaryFatSaturated(value: 1.0, start: now, end: now),
            DietaryFatTotal(value: 1.0, start: now, end: now),
            DietaryFiber(value: 1.0, start: now, end: now),
            DietaryFolate(value: 1.0, start: now, end: now),
            DietaryIodine(value: 1.0, start: now, end: now),
            DietaryIron(value: 1.0, start: now, end: now),
            DietaryMagnesium(value: 1.0, start: now, end: now),
            DietaryManganese(value: 1.0, start: now, end: now),
            DietaryMolybdenum(value: 1.0, start: now, end: now),
            DietaryNiacin(value: 1.0, start: now, end: now),
            DietaryPantothenicAcid(value: 1.0, start: now, end: now),
            DietaryPhosphorus(value: 1.0, start: now, end: now),
            DietaryPotassium(value: 1.0, start: now, end: now),
            DietaryProtein(value: 1.0, start: now, end: now),
            DietaryRiboflavin(value: 1.0, start: now, end: now),
            DietarySelenium(value: 1.0, start: now, end: now),
            DietarySodium(value: 1.0, start: now, end: now),
            DietarySugar(value: 1.0, start: now, end: now),
            DietaryThiamin(value: 1.0, start: now, end: now),
            DietaryVitaminA(value: 1.0, start: now, end: now),
            DietaryVitaminB6(value: 1.0, start: now, end: now),
            DietaryVitaminB12(value: 1.0, start: now, end: now),
            DietaryVitaminC(value: 1.0, start: now, end: now),
            DietaryVitaminD(value: 1.0, start: now, end: now),
            DietaryVitaminE(value: 1.0, start: now, end: now),
            DietaryVitaminK(value: 1.0, start: now, end: now),
            DietaryWater(value: 1.0, start: now, end: now),
            DietaryZinc(value: 1.0, start: now, end: now),
            // Other
            BloodAlcoholContent(value: 1.0, start: now, end: now),
            BloodPressureDiastolic(value: 1.0, start: now, end: now),
            BloodPressureSystolic(value: 1.0, start: now, end: now),
            InsulinDelivery(value: 1.0, start: now, end: now),
            NumberOfAlcoholicBeverages(value: 1.0, start: now, end: now),
            NumberOfTimesFallen(value: 1.0, start: now, end: now),
            TimeInDaylight(value: 1.0, start: now, end: now),
            UvExposure(value: 1.0, start: now, end: now),
            WaterTemperature(value: 1.0, start: now, end: now),
            // Reproductive Health
            BasalBodyTemperature(value: 1.0, start: now, end: now),
            // Respiratory
            ForcedExpiratoryVolume1(value: 1.0, start: now, end: now),
            ForcedVitalCapacity(value: 1.0, start: now, end: now),
            InhalerUsage(value: 1.0, start: now, end: now),
            OxygenSaturation(value: 1.0, start: now, end: now),
            PeakExpiratoryFlowRate(value: 1.0, start: now, end: now),
            RespiratoryRate(value: 1.0, start: now, end: now),
            // Vital Signs
            BloodGlucose(value: 1.0, start: now, end: now),
            BodyTemperature(value: 1.0, start: now, end: now),
        ]
    }

    func testRequestPermissionForAllTypes() async throws {
        let store = HKHealthStore()

        try await store.requestAuthorization(toShare: HKQuantityType.writableTypes, read: HKQuantityType.readableTypes)
        try await store.requestAuthorization(toShare: HKCorrelationType.writableTypes, read: HKCorrelationType.readableTypes)
        try await store.requestAuthorization(toShare: HKCategoryType.writableTypes, read: HKCategoryType.readableTypes)
    }

    func testReadData() async throws {
        let store = HKHealthStore()
        let predicate = HKQuery.predicateForSamples(withStart: now, end: now, options: [])
        let _: [Vo2Max] = try await store.read(
            predicate: predicate,
            sortDescriptors: [.init(\.startDate, order: .reverse)])
    }
}

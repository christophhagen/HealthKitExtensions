import XCTest
import HealthKit
@testable import HealthKitExtensions

final class HealthKitExtensionsTests: XCTestCase {

    let now = Date.now

    private var expectedErrorWhenAccessingHealth: HKError.Code {
        if HealthStore.isHealthDataAvailable() {
            return .errorAuthorizationDenied
        } else {
            return .errorHealthDataUnavailable
        }
    }

    func testCreateAllCategoriesAndFailSaving() async throws {
        // Construct additional types above iOS 16
        let iOS16Samples: [HKCategorySampleContainer] = {
            if #available(iOS 16.0, *) {
                return [
                    InfrequentMenstrualCycles(start: now, end: now),
                    PersistentIntermenstrualBleeding(start: now, end: now),
                    Pregnancy(start: now, end: now),
                    PregnancyTestResult(value: .positive, start: now, end: now),
                    ProlongedMenstrualPeriods(start: now, end: now),

                ]
            } else {
                return []
            }
        }()
        
        let categorySamples: [HKCategorySampleContainer] = iOS16Samples + [
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
            IntermenstrualBleeding(start: now, end: now),
            Lactation(start: now, end: now),
            MenstrualFlow(value: .heavy, cycleStart: true, start: now, end: now),
            OvulationTestResult(value: .negative, start: now, end: now),
            SexualActivity(protectionUsed: true, start: now, end: now),
            SleepAnalysis(value: .inBed, start: now, end: now),
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

        let store = HealthStore()

        // Don't actually request permission, it would crash due to missing usage description
        // try store.requestAuthorization(
        //     toShare: <#T##[any HKSampleTypeContainer.Type]#>,
        //     read: <#T##[any HKObjectTypeContainer.Type]#>)

        do {
            try await store.save(categorySamples)
            XCTFail("Expected saving to fail due to missing permissions")
        } catch let error as HKError {
            XCTAssertEqual(error.code, expectedErrorWhenAccessingHealth)
        } catch {
            XCTFail("Unexpected error saving samples")
        }
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
        metadata.menstrualCycleStart = true

        let cycleStart: Bool? = metadata.menstrualCycleStart
        XCTAssertEqual(cycleStart, true)

        if let start: Bool = metadata.menstrualCycleStart {
            XCTAssertEqual(start, true)
        } else {
            XCTFail()
        }
    }

    func testQuantityInitializer() {
        let temperature = 36.0 // °C

        let sample = BodyTemperature(value: temperature, start: now, end: now)
        let sample2 = BodyTemperature(
            quantity: .init(unit: .degreeFahrenheit(), doubleValue: 96.8),
            start: now, end: now, uuid: .init())

        XCTAssertLessThan(abs(sample.value - sample2.value), 0.001)
    }

    func testMakeAllQuantities() {
        if #available(iOS 16.0, *) {
            let _: [HKQuantitySampleContainer] = [
                AppleSleepingWristTemperature(value: 37.0, start: now, end: now),
                RunningPower(value: 1.0, start: now, end: now),
                RunningSpeed(value: 1.0, start: now, end: now),
                UnderwaterDepth(value: 1.0, start: now, end: now),
                AtrialFibrillationBurden(value: 1.0, start: now, end: now),
                EnvironmentalSoundReduction(value: 1.0, start: now, end: now),
                HeartRateRecoveryOneMinute(value: 1.0, start: now, end: now),
                RunningGroundContactTime(value: 1.0, start: now, end: now),
                RunningStrideLength(value: 1.0, start: now, end: now),
                RunningVerticalOscillation(value: 1.0, start: now, end: now),
                WaterTemperature(value: 1.0, start: now, end: now)
            ]
        }
        if #available(iOS 17.0, watchOS 10.0, macOS 14.0, *) {
            let _: [HKQuantitySampleContainer] = [
                CyclingFunctionalThresholdPower(value: 1.0, start: now, end: now),
                CyclingPower(value: 1.0, start: now, end: now),
                CyclingSpeed(value: 1.0, start: now, end: now),
                CyclingCadence(value: 1.0, start: now, end: now),
                PhysicalEffort(value: 1.0, start: now, end: now),
                TimeInDaylight(value: 1.0, start: now, end: now)
            ]
        }

        let _: [HKQuantitySampleContainer] = [
            // Body
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
            DistanceCycling(value: 1.0, start: now, end: now),
            DistanceDownhillSnowSports(value: 1.0, start: now, end: now),
            DistanceSwimming(value: 1.0, start: now, end: now),
            DistanceWalkingRunning(value: 1.0, start: now, end: now),
            DistanceWheelchair(value: 1.0, start: now, end: now),
            FlightsClimbed(value: 1.0, start: now, end: now),
            NikeFuel(value: 1.0, start: now, end: now),
            PushCount(value: 1.0, start: now, end: now),
            StepCount(value: 1.0, start: now, end: now),
            SwimmingStrokeCount(value: 1.0, start: now, end: now),
            // Hearing Health
            EnvironmentalAudioExposure(value: 1.0, start: now, end: now.addingTimeInterval(1.0)),
            HeadphoneAudioExposure(value: 1.0, start: now, end: now.addingTimeInterval(1.0)),
            // Heart
            HeartRate(countsPerSecond: 1.0, motionContext: .sedentary, start: now, end: now),
            HeartRateVariabilitySDNN(value: 1.0, start: now, end: now),
            PeripheralPerfusionIndex(value: 1.0, start: now, end: now),
            RestingHeartRate(value: 1.0, start: now, end: now),
            Vo2Max(value: 1.0, testType: .maxExercise, start: now, end: now),
            WalkingHeartRateAverage(value: 1.0, start: now, end: now),
            // Mobility
            AppleWalkingSteadiness(value: 1.0, start: now, end: now),
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
            InsulinDelivery(amount: 1.0, reason: .basal, start: now, end: now),
            NumberOfAlcoholicBeverages(value: 1.0, start: now, end: now),
            NumberOfTimesFallen(value: 1.0, start: now, end: now),
            UvExposure(value: 1.0, start: now, end: now),
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
        // Don't request permissions, it will fail due to missing entitlements
        /*
        let store = HealthStore()
        if HealthStore.isHealthDataAvailable() {
            try await store.requestAuthorization(toShare: HKQuantityType.writableTypes, read: HKQuantityType.readableTypes)
            try await store.requestAuthorization(toShare: HKCorrelationType.writableTypes, read: HKCorrelationType.readableTypes)
            try await store.requestAuthorization(toShare: HKCategoryType.writableTypes, read: HKCategoryType.readableTypes)

            try await store.requestAuthorization(toShare: HKWorkout.self, read: HKWorkout.self)
            _ = store.authorizationStatus(for: SexualActivity.self)
        }
         */
    }

    @available(iOS 15.4, *)
    func testReadData() async throws {
        let store = HealthStore()
        do {
            let _: [Vo2Max] = try await store.samples(from: now, to: now, sortedBy: .descendingStartDate)
            XCTFail()
        } catch let error as HKError {
            XCTAssertEqual(error.code, expectedErrorWhenAccessingHealth)
        } catch {
            XCTFail()
        }

    }

    private func compare(_ key: HKMetadataKey, _ value: String) {
        XCTAssertEqual(key.rawValue, value)
    }


    @available(iOS 17.0, macOS 14.0, watchOS 10.0, *)
    func testMetadataKeysIOS17() throws {
        compare(.activityType, HKMetadataKeyActivityType)
        compare(.cyclingFunctionalThresholdPowerTestType, HKMetadataKeyCyclingFunctionalThresholdPowerTestType)
        compare(.fitnessPlusSession, HKMetadataKeyAppleFitnessPlusSession)
        compare(.maximumLightIntensity, HKMetadataKeyMaximumLightIntensity)
        compare(.physicalEffortEstimationType, HKMetadataKeyPhysicalEffortEstimationType)
        compare(.waterSalinity, HKMetadataKeyWaterSalinity)
    }

    @available(iOS 16.4, macOS 13.3, watchOS 9.4, *)
    func testMetadataKeysIOS16_4() throws {
        compare(.headphoneGain, HKMetadataKeyHeadphoneGain)

    }

    @available(iOS 16.0, macOS 13.0, watchOS 9.0, *)
    func testMetadataKeysIOS16() throws {
        compare(.glassesPrescriptionDescription, HKMetadataKeyGlassesPrescriptionDescription)
        compare(.heartRateRecoveryActivityDuration, HKMetadataKeyHeartRateRecoveryActivityDuration)
        compare(.heartRateRecoveryActivityType, HKMetadataKeyHeartRateRecoveryActivityType)
        compare(.heartRateRecoveryMaxObservedRecoveryHeartRate, HKMetadataKeyHeartRateRecoveryMaxObservedRecoveryHeartRate)
        compare(.heartRateRecoveryTestType, HKMetadataKeyHeartRateRecoveryTestType)
        compare(.quantityClampedToLowerBound, HKMetadataKeyQuantityClampedToLowerBound)
        compare(.quantityClampedToUpperBound, HKMetadataKeyQuantityClampedToUpperBound)
        compare(.sessionEstimate, HKMetadataKeySessionEstimate)
        compare(.swoflScore, HKMetadataKeySWOLFScore)
        compare(.userMotionContext, HKMetadataKeyUserMotionContext)
    }

    func testMetadataKeys() throws {
        compare(.algorithmVersion, HKMetadataKeyAlgorithmVersion)
        compare(.alpineSlopeGrade, HKMetadataKeyAlpineSlopeGrade)
        compare(.appleDeviceCalibrated, HKMetadataKeyAppleDeviceCalibrated)
        compare(.appleECGAlgorithmVersion, HKMetadataKeyAppleECGAlgorithmVersion)
        compare(.audioExposureDuration, HKMetadataKeyAudioExposureDuration)
        compare(.audioExposureLevel, HKMetadataKeyAudioExposureLevel)
        compare(.averageMETs, HKMetadataKeyAverageMETs)
        compare(.averageSpeed, HKMetadataKeyAverageSpeed)
        compare(.barometricPressure, HKMetadataKeyBarometricPressure)
        compare(.bloodGlucoseMealTime, HKMetadataKeyBloodGlucoseMealTime)
        compare(.bodyTemperatureSensorLocation, HKMetadataKeyBodyTemperatureSensorLocation)
        compare(.coachedWorkout, HKMetadataKeyCoachedWorkout)
        compare(.crossTrainerDistance, HKMetadataKeyCrossTrainerDistance)
        compare(.dateOfEarliestDataUsedForEstimate, HKMetadataKeyDateOfEarliestDataUsedForEstimate)
        compare(.deviceManufacturerName, HKMetadataKeyDeviceManufacturerName)
        compare(.deviceName, HKMetadataKeyDeviceName)
        compare(.devicePlacementSide, HKMetadataKeyDevicePlacementSide)
        compare(.deviceSerialNumber, HKMetadataKeyDeviceSerialNumber)
        compare(.digitalSignature, HKMetadataKeyDigitalSignature)
        compare(.elevationAscended, HKMetadataKeyElevationAscended)
        compare(.externalUUID, HKMetadataKeyExternalUUID)
        compare(.fitnessMachineDuration, HKMetadataKeyFitnessMachineDuration)
        compare(.foodType, HKMetadataKeyFoodType)
        compare(.groupFitness, HKMetadataKeyGroupFitness)
        compare(.heartRateEventThreshold, HKMetadataKeyHeartRateEventThreshold)
        compare(.heartRateMotionContext, HKMetadataKeyHeartRateMotionContext)
        compare(.heartRateSensorLocation, HKMetadataKeyHeartRateSensorLocation)
        compare(.indoorBikeDistance, HKMetadataKeyIndoorBikeDistance)
        compare(.indoorWorkout, HKMetadataKeyIndoorWorkout)
        compare(.insulinDeliveryReason, HKMetadataKeyInsulinDeliveryReason)
        compare(.keySyncVersion, HKMetadataKeySyncVersion)
        compare(.lowCardioFitnessEventThreshold, HKMetadataKeyLowCardioFitnessEventThreshold)
        compare(.lapLength, HKMetadataKeyLapLength)
        compare(.maximumSpeed, HKMetadataKeyMaximumSpeed)
        compare(.menstrualCycleStart, HKMetadataKeyMenstrualCycleStart)
        compare(.referenceRangeLowerLimit, HKMetadataKeyReferenceRangeLowerLimit)
        compare(.referenceRangeUpperLimit, HKMetadataKeyReferenceRangeUpperLimit)
        compare(.sessionId, "sessionId")
        compare(.sexualActivityProtectionUsed, HKMetadataKeySexualActivityProtectionUsed)
        compare(.subIndex, "subIndex")
        compare(.swimmingLocationType, HKMetadataKeySwimmingLocationType)
        compare(.swimmingStrokeStyle, HKMetadataKeySwimmingStrokeStyle)
        compare(.syncIdentifier, HKMetadataKeySyncIdentifier)
        compare(.timeZone, HKMetadataKeyTimeZone)
        compare(.udiDeviceIdentifier, HKMetadataKeyUDIDeviceIdentifier)
        compare(.udiProductionIdentifier, HKMetadataKeyUDIProductionIdentifier)
        compare(.vO2MaxTestType, HKMetadataKeyVO2MaxTestType)
        compare(.vo2MaxValue, HKMetadataKeyVO2MaxValue)
        compare(.wasTakenInLab, HKMetadataKeyWasTakenInLab)
        compare(.wasUserEntered, HKMetadataKeyWasUserEntered)
        compare(.weatherHumidity, HKMetadataKeyWeatherHumidity)
        compare(.weatherTemperature, HKMetadataKeyWeatherTemperature)
        compare(.workoutBrandName, HKMetadataKeyWorkoutBrandName)
    }

    func testQuantityTypeUnit() throws {
        func compare(_ id: HKQuantityTypeIdentifier) {
            let type = HKQuantityType(id)
            XCTAssertEqual(id.rawValue, type.identifier)
            guard let defaultUnit = id.defaultUnit else {
                return
            }
            guard let typeUnit = type.defaultUnit else {
                XCTFail()
                return
            }
            XCTAssertEqual(defaultUnit, typeUnit)
        }

        for id in HKQuantityTypeIdentifier.allCases {
            compare(id)
        }
    }
}

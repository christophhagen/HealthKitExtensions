import Foundation
import HealthKit

extension HKWorkout: HKSampleTypeContainer {

    public static var sampleType: HKSampleType { .workoutType() }
}

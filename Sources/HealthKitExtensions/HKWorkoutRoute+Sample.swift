import Foundation
import HealthKit

extension HKWorkoutRoute: HKSampleTypeContainer {

    public static var sampleType: HKSampleType { HKSeriesType.workoutRoute() }
}

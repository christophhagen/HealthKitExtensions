import Foundation
import HealthKit

extension HKWorkoutActivityType {

    var workoutPredicate: NSPredicate {
        HKQuery.predicateForWorkouts(with: self)
    }
}

import Foundation
import HealthKit

extension HKCorrelationType {

    public static var readableTypes: [HKCorrelationContainer.Type] {
        [
            //BloodPressure.self,
            //Food.self,
        ]
    }

    public static var writableTypes: [HKCorrelationContainer.Type] {
        [
            
        ]
    }
}

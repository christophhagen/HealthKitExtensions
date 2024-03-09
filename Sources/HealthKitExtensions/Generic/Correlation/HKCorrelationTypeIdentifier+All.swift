import Foundation
import HealthKit

extension HKCorrelationTypeIdentifier: CaseIterable {

    /**
     All known correlation types for the targeted OS.
     */
    public static var allCases: [HKCorrelationTypeIdentifier] {
        return [
            .bloodPressure,
            .food,
        ]
    }
}

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

extension HKCorrelationTypeIdentifier: CustomStringConvertible {

    public var description: String {
        switch self {
        case .bloodPressure: return "Blood Pressure"
        case .food: return "Food"
        default: return rawValue
        }
    }
}

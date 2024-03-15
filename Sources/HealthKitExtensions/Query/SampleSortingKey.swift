import Foundation
import HealthKit

enum SampleSortingKey: RawRepresentable {

    /// Sort by start date
    case start

    /// Sort by end date
    case end

    init?(rawValue: String) {
        switch rawValue {
        case HKSampleSortIdentifierStartDate: self = .start
        case HKSampleSortIdentifierEndDate: self = .end
        default: return nil
        }
    }

    var rawValue: String {
        switch self {
        case .start:
            return HKSampleSortIdentifierStartDate
        case .end:
            return HKSampleSortIdentifierEndDate
        }
    }

    func keyPath<Compared>() -> KeyPath<Compared, Date> where Compared: HKSample {
        switch self {
        case .start:
            return \.startDate
        case .end:
            return \.endDate
        }
    }
}

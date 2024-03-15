import Foundation
import HealthKit

public enum SampleSortingMethod {

    /// Sort by ascending start date
    case ascendingStartDate

    /// Sort by descending start date
    case descendingStartDate

    /// Sort by ascending end date
    case ascendingEndDate

    /// Sort by descending end date
    case descendingEndDate

    var key: String {
        sortingKey.rawValue
    }

    var ascending: Bool {
        switch self {
        case .ascendingStartDate, .ascendingEndDate:
            return true
        case .descendingStartDate, .descendingEndDate:
            return false
        }
    }

    var sortingKey: SampleSortingKey {
        switch self {
        case .ascendingStartDate, .descendingStartDate:
            return .start
        case .ascendingEndDate, .descendingEndDate:
            return .end
        }
    }

    var order: SortOrder {
        ascending ? .forward : .reverse
    }

    var descriptor: NSSortDescriptor {
        .init(key: key, ascending: ascending)
    }

    var quantityDescriptor: SortDescriptor<HKQuantitySample> {
        .init(sortingKey.keyPath(), order: order)
    }

    func sampleSortDescriptor<T>(sorting type: T.Type = T.self) -> SortDescriptor<T> where T: HKSample {
        .init(sortingKey.keyPath(), order: order)
    }
}

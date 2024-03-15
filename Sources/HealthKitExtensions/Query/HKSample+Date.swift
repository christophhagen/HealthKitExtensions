import Foundation
import HealthKit

extension Sequence where Element: HKSample {

    /**
     Filter the sequence to contain only samples overlapping the date range.
     */
    public func filtered(from start: Date, to end: Date) -> [Element] {
        filter { $0.startDate < end && $0.endDate > start }
    }
}

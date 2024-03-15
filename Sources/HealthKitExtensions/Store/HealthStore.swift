import Foundation
import HealthKit

/**
 A wrapper for a health store.

 Use this class with a health store to access the health data in more convenient ways.
 */
public final class HealthStore {

    /// The wrapped health store
    public let store: HKHealthStore

    /**
     Wrap a health store
     */
    public init(wrapping store: HKHealthStore = .init()) {
        self.store = store
    }
}

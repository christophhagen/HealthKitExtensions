import Foundation

extension Sequence {

    /**
     Transform all elements and join the resulting sequences together.
     */
    func mapAndJoin<T,S>(_ transform: (Element) throws -> S) rethrows -> [T] where S: Sequence<T> {
        try reduce(into: []) { $0 += try transform($1) }
    }

    /**
     Transform all elements and join the resulting sequences together.
     */
    func mapAndJoin<T,S>(_ transform: (Element) async throws -> S) async rethrows -> [T] where S: Sequence<T> {
        var result = [T]()
        for element in self {
            result += try await transform(element)
        }
        return result
    }

    func sorted<T>(ascending: Bool = true, using conversion: (Element) -> T) -> [Element] where T: Comparable {
        if ascending {
            return sorted { conversion($0) < conversion($1) }
        } else {
            return sorted { conversion($0) > conversion($1) }
        }
    }
}

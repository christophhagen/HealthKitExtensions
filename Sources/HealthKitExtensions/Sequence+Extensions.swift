import Foundation

extension Sequence {

    func sorted<T>(ascending: Bool = true, using conversion: (Element) -> T) -> [Element] where T: Comparable {
        if ascending {
            return sorted { conversion($0) < conversion($1) }
        } else {
            return sorted { conversion($0) > conversion($1) }
        }
    }

}

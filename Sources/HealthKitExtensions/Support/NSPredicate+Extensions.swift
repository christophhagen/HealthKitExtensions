import Foundation

extension Optional where Wrapped == NSPredicate {

    func and(_ predicate: NSPredicate?) -> NSPredicate? {
        guard let self else {
            return predicate
        }
        return self.and(predicate)
    }
}

extension NSPredicate {

    func and(_ predicate: NSPredicate?) -> NSPredicate {
        guard let predicate else {
            return self
        }
        return NSCompoundPredicate(type: .and, subpredicates: [self, predicate])
    }
}

import Foundation

extension Metadata {

    var externalUUID: UUID? {
        get {
            guard let uuidString: String = value(for: .externalUUID) else {
                return nil
            }
            return .init(uuidString: uuidString)
        }
        set {
            set(value: newValue?.uuidString, for: .externalUUID)
        }
    }
}

extension Metadata? {

    func adding(uuid: UUID?) -> Metadata? {
        guard let uuid else {
            return self
        }
        var result = self ?? [:]
        result[.externalUUID] = uuid.uuidString
        return result
    }
}

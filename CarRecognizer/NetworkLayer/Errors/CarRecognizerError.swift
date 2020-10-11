import Moya

extension Error {
    func localizedInfo() -> (title: String, description: String?) {
        CarRecognizerError.getFrom(data: self)
    }
}

extension NSError {
    func localizedInfo() -> (title: String, description: String?) {
        CarRecognizerError.getFrom(data: self)
    }
}

class CarRecognizerError {
    static func getFrom(data: Any) -> (title: String, description: String?) {
        var result: (title: String, description: String?)
        if let error = data as? ICarRecognizerLocalizedError {
            result.title = error.info.title
            result.description = error.info.description
        } else {
            if let localError =  (data as? Error) ?? (data as? NSError) {
                result.title = localError.localizedDescription
                result.description = nil
            } else {
                result.title = L10n.Errors.Unknown.title
                result.description = nil
            }
        }
        return result
    }
}

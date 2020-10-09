import Foundation
import Moya

extension MoyaError: ICarRecognizerLocalizedError {
    public var info: (title: String, description: String?) {
        var result: (title: String, description: String?)
        switch self {
        case .objectMapping(_, _):
            result.title = L10n.Errors.Moya.Parsing.title
            result.description = L10n.Errors.Moya.Parsing.description
        case .jsonMapping(_):
            result.title = L10n.Errors.Moya.Parsing.title
            result.description = L10n.Errors.Moya.Parsing.description
        case .underlying(let underlyingError, _):
            return underlyingError.localizedInfo()
        default:
            return (title: String(describing: self), description: self.localizedDescription)
        }
        return result
    }
}

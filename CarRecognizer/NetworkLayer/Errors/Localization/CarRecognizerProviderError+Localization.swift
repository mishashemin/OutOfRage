import Foundation
import Moya

extension CarRecognizerProviderError: ICarRecognizerLocalizedError {
    public var info: (title: String, description: String?) {
        var result: (title: String, description: String?)
        switch self.errorCode {
        case .serverError:
            result.title = L10n.Errors.CarRecognizerProvider.ServerError.title
            result.description = L10n.Errors.CarRecognizerProvider.ServerError.description
        case .securityError:
            result.title = L10n.Errors.CarRecognizerProvider.SecurityError.title
            result.description = L10n.Errors.CarRecognizerProvider.SecurityError.description
        case .timeoutError:
            result.title = L10n.Errors.CarRecognizerProvider.TimeoutError.title
            result.description = L10n.Errors.CarRecognizerProvider.TimeoutError.description
        case .connectionFailed:
            result.title = L10n.Errors.CarRecognizerProvider.ConnectionFailed.title
            result.description = L10n.Errors.CarRecognizerProvider.ConnectionFailed.description
        case .moyaError:            
            if let moyaError = self.underlyingError as? MoyaError {
                result.title = moyaError.info.title
                result.description = moyaError.info.description
            } else {
                result.title = self.localizedDescription
                result.description = nil
            }
        }
        return result
                
    }
}

import Moya
import Alamofire

extension MoyaError {

    public func carRecognizerConverter() -> MoyaError {
        if case MoyaError.underlying(let error, let response) = self {
            
            var currentError = error
            
            if let error = error as? Alamofire.AFError {
                if let underlyingError = error.underlyingError {
                    currentError = underlyingError
                }
            }
            
            if let error = currentError as? URLError {
                let code = URLError.Code(rawValue: error.errorCode)
                switch code {
                case URLError.Code.timedOut:
                    
                    let error = CarRecognizerProviderError(code: .timeoutError, underlyingError: error)
                    return MoyaError.underlying(error, response)

                case URLError.Code.badURL,
                     URLError.Code.unsupportedURL,
                     URLError.Code.notConnectedToInternet,
                     URLError.Code.cannotConnectToHost,
                     URLError.Code.cannotFindHost,
                     URLError.Code.networkConnectionLost,
                     URLError.Code.dnsLookupFailed,
                     URLError.Code.httpTooManyRedirects,
                     URLError.Code.resourceUnavailable,
                     URLError.Code.redirectToNonExistentLocation,
                     URLError.Code.internationalRoamingOff,
                     URLError.Code.callIsActive,
                     URLError.Code.dataNotAllowed,
                     URLError.Code.secureConnectionFailed,
                     URLError.Code.cannotLoadFromNetwork:
                    let error = CarRecognizerProviderError(code: .connectionFailed, underlyingError: error)
                    return MoyaError.underlying(error, response)

                default:
                    return MoyaError.underlying(error, response)
                }
            }

            return MoyaError.underlying(error, response)
        }
        return self
    }
}

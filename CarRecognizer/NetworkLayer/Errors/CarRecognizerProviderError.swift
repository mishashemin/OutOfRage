import Moya

public enum CarRecognizerProviderErrorCode: Int, IBaseErrorCode {
    case serverError = 0
    case securityError = 1
    case timeoutError = 2
    case connectionFailed = 3
    case moyaError = 4    
}

public class CarRecognizerProviderError: BaseError <CarRecognizerProviderErrorCode> {
    public override var domainShortname: String {
        "OOR"
    }
}

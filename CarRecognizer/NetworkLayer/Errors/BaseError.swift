import Foundation

public protocol IBaseErrorCode: RawRepresentable where RawValue == Int {}

public class BaseError<ErrorCode: IBaseErrorCode>: NSError {
    init(code: ErrorCode, underlyingError: Error? = nil, systemMessage: String? = nil) {
        var userInfo: [String: Any] = [:]
        if let underlyingError = underlyingError {
            userInfo[NSUnderlyingErrorKey] = underlyingError
        }
        if let systemMessage = systemMessage {
            userInfo[NSLocalizedFailureReasonErrorKey] = systemMessage
        }
        super.init(domain: String(describing: type(of: self)), code: code.rawValue, userInfo: userInfo)
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }

    var errorCode: ErrorCode {
        ErrorCode(rawValue: self.code)!
    }
    
    var domainShortname: String {
        String(describing: type(of: self))
    }
    
    var underlyingError: Any? {
        self.userInfo[NSUnderlyingErrorKey]
    }
    
    var systemMessage: String? {
        userInfo[NSLocalizedFailureReasonErrorKey] as? String
    }
}

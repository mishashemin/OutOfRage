//
//  File.swift
//  CarRecognizer
//
//  Created by Mikhail Shemin on 10.10.2020.
//

import Foundation

public enum RecognizerServiceErrorCode: Int, IBaseErrorCode {
    case otherError = 0
    case recognizeError = 1
    case imageFormatError = 2
}

public class RecognizerServiceError: BaseError <RecognizerServiceErrorCode> {
    public override var domainShortname: String {
        "CSE"
    }
}

extension RecognizerServiceError {
    static func convertError(_ error: Error) -> RecognizerServiceError {
        if let serviceError = error as? RecognizerServiceError {
            return serviceError
        }
        return RecognizerServiceError(code: .otherError, underlyingError: error)
    }
}

extension RecognizerServiceError: ICarRecognizerLocalizedError {
    public var info: (title: String, description: String?) {
        switch self.errorCode {
        case .recognizeError:
            return (title: L10n.Errors.RecognizerService.title,
                    description: L10n.Errors.RecognizerService.RecognizeError.description)
        case .imageFormatError:
            return (title: L10n.Errors.RecognizerService.title,
                    description: L10n.Errors.RecognizerService.ImageFormatError.description)
        case .otherError:
            if let localizedError = self.underlyingError as? ICarRecognizerLocalizedError {
                return localizedError.info
            } else {
                return (title: L10n.Errors.Unknown.title, description: L10n.Errors.Unknown.description)
            }
        }
    }
}

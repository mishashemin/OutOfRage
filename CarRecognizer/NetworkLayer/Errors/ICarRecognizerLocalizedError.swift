import Foundation

public protocol ICarRecognizerLocalizedError {
    var info: (title: String, description: String?) { get }
}

public extension ICarRecognizerLocalizedError {
    var title: String {
        return info.title
    }

    var described: String? {
        return info.description
    }

    var infoString: String {
        var result = "\(info.title)"
        let description = (info.description ?? "").trimmingCharacters(in: .whitespaces)

        if !description.isEmpty {
            result += ": \(description)"
        }
        return result
    }
}

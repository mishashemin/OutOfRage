// swiftlint:disable all
// Generated using SwiftGen — https://github.com/SwiftGen/SwiftGen

import Foundation

// swiftlint:disable superfluous_disable_command file_length implicit_return

// MARK: - Strings

// swiftlint:disable explicit_type_interface function_parameter_count identifier_name line_length
// swiftlint:disable nesting type_body_length type_name vertical_whitespace_opening_braces
internal enum L10n {

  internal enum Errors {
    internal enum CarRecognizerProvider {
      internal enum ConnectionFailed {
        /// Проверьте подключение к интернету и повторите снова
        internal static let description = L10n.tr("Localizable", "Errors.CarRecognizerProvider.connectionFailed.description")
        /// Ошибка соединения
        internal static let title = L10n.tr("Localizable", "Errors.CarRecognizerProvider.connectionFailed.title")
      }
      internal enum SecurityError {
        /// Требуется авторизация
        internal static let description = L10n.tr("Localizable", "Errors.CarRecognizerProvider.securityError.description")
        /// Ошибка
        internal static let title = L10n.tr("Localizable", "Errors.CarRecognizerProvider.securityError.title")
      }
      internal enum ServerError {
        /// Произошла ошибка. Попробуйте позже
        internal static let description = L10n.tr("Localizable", "Errors.CarRecognizerProvider.serverError.description")
        /// Ошибка
        internal static let title = L10n.tr("Localizable", "Errors.CarRecognizerProvider.serverError.title")
      }
      internal enum TimeoutError {
        /// Похоже, сервер слишком долго отвечает, повторите попытку через некоторое время
        internal static let description = L10n.tr("Localizable", "Errors.CarRecognizerProvider.timeoutError.description")
        /// Ошибка по таймауту
        internal static let title = L10n.tr("Localizable", "Errors.CarRecognizerProvider.timeoutError.title")
      }
    }
    internal enum Moya {
      internal enum Parsing {
        /// Неверный ответ от сервера
        internal static let description = L10n.tr("Localizable", "Errors.Moya.parsing.description")
        /// Ошибка
        internal static let title = L10n.tr("Localizable", "Errors.Moya.parsing.title")
      }
    }
    internal enum Unknown {
      /// 
      internal static let description = L10n.tr("Localizable", "Errors.Unknown.description")
      /// Неизвестная ошибка
      internal static let title = L10n.tr("Localizable", "Errors.Unknown.title")
    }
  }
}
// swiftlint:enable explicit_type_interface function_parameter_count identifier_name line_length
// swiftlint:enable nesting type_body_length type_name vertical_whitespace_opening_braces

// MARK: - Implementation Details

extension L10n {
  private static func tr(_ table: String, _ key: String, _ args: CVarArg...) -> String {
    let format = BundleToken.bundle.localizedString(forKey: key, value: nil, table: table)
    return String(format: format, locale: Locale.current, arguments: args)
  }
}

// swiftlint:disable convenience_type
private final class BundleToken {
  static let bundle = Bundle(for: BundleToken.self)
}
// swiftlint:enable convenience_type

import Foundation
import RxCocoa

protocol IAccountStorage {
    var accessToken: String? { get set }
    func clearData()
}

class AccountStorage: IAccountStorage {
    private let storage: IKeychainStorage

    var accessToken: String? {
        didSet {
            self.storage.setValue(value: self.accessToken, forKey: StorageKeys.accessToken.rawValue)
        }
    }

    // MARK: - Init
    init(storage: IKeychainStorage) {
        self.storage = storage

        self.accessToken = self.storage.getValue(forKey: StorageKeys.accessToken.rawValue, type: String.self)
    }
    
    func invalidateAccessToken() {
        self.accessToken = nil
    }
    
    func clearData() {
        self.invalidateAccessToken()
    }
}

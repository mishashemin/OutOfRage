import Foundation
import RxCocoa

protocol IAccountStorage {
    var deviceID: String { get set }
    var accessToken: String? { get set }
    var refreshToken: String? { get set }
    func clearData()
}

class AccountStorage: IAccountStorage {
    private let storage: IKeychainStorage

    var deviceID: String {
        didSet {
            self.storage.setValue(value: self.deviceID, forKey: StorageKeys.deviceID.rawValue)
        }
    }

    var accessToken: String? {
        didSet {
            self.storage.setValue(value: self.accessToken, forKey: StorageKeys.accessToken.rawValue)
        }
    }
    var refreshToken: String? {
        didSet {
            self.storage.setValue(value: self.refreshToken, forKey: StorageKeys.refreshToken.rawValue)
        }
    }

    // MARK: - Init
    init(storage: IKeychainStorage) {
        self.storage = storage

        self.accessToken = self.storage.getValue(forKey: StorageKeys.accessToken.rawValue, type: String.self)
        self.refreshToken = self.storage.getValue(forKey: StorageKeys.refreshToken.rawValue, type: String.self)
        
        if let id = self.storage.getValue(forKey: StorageKeys.deviceID.rawValue, type: String.self) {
            self.deviceID = id
        } else {
            self.deviceID = NSUUID().uuidString
        }
    }
        
    func invalidateTokens() {
        self.invalidateRefreshToken()
        self.invalidateAccessToken()
    }

    func invalidateAccessToken() {
        self.accessToken = nil
    }

    func invalidateRefreshToken() {
        self.refreshToken = nil
    }
    
    func clearData() {
        self.invalidateTokens()
    }
}


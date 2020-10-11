import Foundation

protocol IAccountServiceContext {
    var accountService: IAccountService { get }
}

protocol IRecognizerServiceContext {
    var recognizerService: IRecognizerService { get }
}

protocol IAppContext: IAccountServiceContext & IRecognizerServiceContext {}

class AppContext: IAppContext {
    
    // MARK: - Properties
    
    private (set) var accountService: IAccountService
    private (set) var recognizerService: IRecognizerService
    var accountStorage: IAccountStorage
    
    // MARK: - Lifecycle
    init() {
        let keychainStorage = KeychainStorage(prefix: String(describing: AccountStorage.self), icloud: false)
        
        self.accountStorage = AccountStorage(storage: keychainStorage)
        self.accountService = AccountService(accountStorage: self.accountStorage)
        self.recognizerService = RecognizerService()
    }
}

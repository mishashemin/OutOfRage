//
//  File.swift
//  CarRecognizer
//
//  Created by Mikhail Shemin on 09.10.2020.
//

import RxSwift
import RxCocoa
import Moya

protocol IAccountService: ICarRecognizerTokenManager {
    var isAuthenticated: Bool { get }
    
    var willLogoutEvent: PublishRelay<()> {get}
    var didLogoutEvent: PublishRelay<()> {get}
    
    func signOut()
}

class AccountService: IAccountService {
    private(set) var accountStorage: IAccountStorage
    
    var isAuthenticated: Bool {
        accountStorage.accessToken != nil
    }

    var willLogoutEvent: PublishRelay<()>
    var didLogoutEvent: PublishRelay<()>
    
    func signOut() {
        self.willLogoutEvent.accept(())
        self.accountStorage.clearData()
        self.didLogoutEvent.accept(())
    }
    
    init(accountStorage: IAccountStorage) {
        self.accountStorage = accountStorage
        self.willLogoutEvent = PublishRelay<()>()
        self.didLogoutEvent = PublishRelay<()>()
    }
}

extension AccountService: ICarRecognizerTokenManager {
    func getAccessToken() -> String? {
        return (accountStorage.accessToken)
    }
}

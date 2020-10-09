//
//  Flow2ViewModel.swift
//  Demo
//
//  Created by Mikhail Shemin on 30.09.2020.
//

import RxSwift
import RxRelay

protocol IModule2ViewModel {
    func backAction()
    
    var onBackAction: (() -> Void)? { get }
}

class Module2ViewModel: IModule2ViewModel {
    
    typealias Context = IAppContext
    
    // MARK: - Properties
    private var context: Context
        
    private let disposeBag = DisposeBag()
    
    var onBackAction: (() -> Void)?
    
    // MARK: - Lifecycle
    init(context: Context) {
        self.context = context
        setupRx()
    }
    
    deinit {
        #if DEBUG
        print("💭 deinit Flow2ViewModel")
        #endif
    }
    
    func backAction() {
        onBackAction?()
    }
    
    // MARK: - Private
    private func setupRx() {
    }
}


//
//  CurrentCarViewModel.swift
//  CarRecognizer
//
//  Created by Mikhail Shemin on 11.10.2020.
//

import RxSwift
import RxRelay

protocol ICurrentCarViewModel {
    func backAction()
    
    var onBackAction: (() -> Void)? { get }
    var carModel: CarModel { get }
}

protocol ICurrentCarViewModelCoordinable {
}

class CurrentCarViewModel: ICurrentCarViewModel, ICurrentCarViewModelCoordinable {
    
    typealias Context = IAppContext
    
    // MARK: - Properties
    private var context: Context
        
    private let disposeBag = DisposeBag()
    
    
    var onBackAction: (() -> Void)?
    
    let carModel: CarModel
    
    // MARK: - Lifecycle
    init(context: Context, carModel: CarModel) {
        self.context = context
        self.carModel = carModel
        setupRx()
    }
    
    deinit {
        #if DEBUG
        print("💭 deinit CurrentCarViewModel")
        #endif
    }
    
    // MARK: - Private
    private func setupRx() {
    }
    
    func backAction() {
        onBackAction?()
    }
}

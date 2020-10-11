//
//  Flow2ViewModel.swift
//  Demo
//
//  Created by Mikhail Shemin on 30.09.2020.
//

import RxSwift
import RxRelay

protocol ICarListViewModel {
    var carModels: [CarModel] { get }
    
    func backAction()
    func select(index: Int)
    
    var onBackAction: (() -> Void)? { get }
}

class CarListViewModel: ICarListViewModel {
    
    typealias Context = IAppContext
    
    // MARK: - Properties
    private var context: Context
        
    private let disposeBag = DisposeBag()
    
    var carModels: [CarModel]
    
    var onBackAction: (() -> Void)?
    var onSelectAction: ((CarModel) -> Void)?
    
    // MARK: - Lifecycle
    init(context: Context, carModels: [CarModel]) {
        self.context = context
        self.carModels = carModels
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
    
    func select(index: Int) {
        onSelectAction?(carModels[index])
    }
    
    // MARK: - Private
    private func setupRx() {
    }
}

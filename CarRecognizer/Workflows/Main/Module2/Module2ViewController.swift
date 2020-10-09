//
//  Flow2ViewController.swift
//  Demo
//
//  Created by Mikhail Shemin on 30.09.2020.
//

import UIKit
import RxSwift

class Module2ViewController: UIViewController {

    // MARK: - Outlets
    
    // MARK: - Actions
    @objc func backAction() {
        viewModel.backAction()
    }
    
    // MARK: - Properties
    var viewModel: IModule2ViewModel!
    private(set) var disposeBag = DisposeBag()
    
    // MARK: - lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setupViews()
        self.bindToViewModel()
    }
    
    deinit {
        #if DEBUG
        print("💭 deinit " + type(of: self).nameOfClass)
        #endif
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.setNavigationBarHidden(false, animated: true)
    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
    }

    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
    }

    // MARK: - Private
    private func setupViews() {
        self.navigationItem.title = "Module2"
        self.setBarButtonItem(for: #selector(backAction))
    }
       
    private func bindToViewModel() {
    }
}

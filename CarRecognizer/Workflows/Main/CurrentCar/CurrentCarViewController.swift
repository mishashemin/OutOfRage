//
//  CurrentCarViewController.swift
//  CarRecognizer
//
//  Created by Mikhail Shemin on 11.10.2020.
//

import UIKit
import RxSwift
import Kingfisher

class CurrentCarViewController: UIViewController {

    // MARK: - Outlets
    @IBOutlet var nameLabel: UILabel!
    @IBOutlet var priceLabel: UILabel!
    @IBOutlet var countryOfOriginLabel: UILabel!
    @IBOutlet var generationLabel: UILabel!
    @IBOutlet var bodyTypeLabel: UILabel!
    @IBOutlet var carTypeLabel: UILabel!
    @IBOutlet var iconImageView: UIImageView!
    // MARK: - Actions
    @objc func backAction() {
        viewModel.backAction()
    }
    
    // MARK: - Properties
    var viewModel: ICurrentCarViewModel!
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
    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
    }

    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
    }

    // MARK: - Private
    private func setupViews() {
        nameLabel.text = viewModel.carModel.model + " " + viewModel.carModel.brand
    }
       
    private func bindToViewModel() {
        self.setBarButtonItem(for: #selector(backAction))
    }
}

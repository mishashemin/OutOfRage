//
//  Flow2ViewController.swift
//  Demo
//
//  Created by Mikhail Shemin on 30.09.2020.
//

import UIKit
import RxSwift

class CarListViewController: UIViewController {

    // MARK: - Outlets
    @IBOutlet var collectionView: UICollectionView!
    
    // MARK: - Actions
    @objc func backAction() {
        viewModel.backAction()
    }
    
    // MARK: - Properties
    var viewModel: ICarListViewModel!
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
        self.navigationItem.title = "Результаты сканирования"
        self.setBarButtonItem(for: #selector(backAction))
        
        self.collectionView.dataSource = self
        self.collectionView.delegate = self
        
        self.collectionView.register(cellType: CarCollectionViewCell.self)
    }
       
    private func bindToViewModel() {
    }
}

extension CarListViewController: UICollectionViewDelegate, UICollectionViewDelegateFlowLayout, UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return viewModel.carModels.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(for: indexPath) as CarCollectionViewCell
        let carModel = viewModel.carModels[indexPath.row]
        cell.configure(with: carModel.brand + " " + carModel.model, price: carModel.price, imageUrl: carModel.iconUrl)
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        self.viewModel.select(index: indexPath.row)
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = collectionView.frame.width
        let height = collectionView.frame.height / 2.0
        return CGSize(width: width, height: height)
    }

}

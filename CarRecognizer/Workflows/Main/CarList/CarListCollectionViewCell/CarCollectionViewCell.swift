//
//  File.swift
//  CarRecognizer
//
//  Created by Mikhail Shemin on 11.10.2020.
//
import UIKit
import Reusable
import Kingfisher

class CarCollectionViewCell: UICollectionViewCell, NibReusable {

    @IBOutlet var mainView: UIView!
    @IBOutlet var nameLabel: UILabel!
    @IBOutlet var priceLabel: UILabel!
    @IBOutlet var icon: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        mainView.layer.cornerRadius = 8
        mainView.layer.borderWidth = 2
        mainView.layer.borderColor = Asset.Colors.border.color.cgColor
        nameLabel.theme.fontSize(14)
        priceLabel.theme.fontSize(14)
    }
    
    func configure(with name: String, price: Int, imageUrl: String) {
        let url = URL(string: imageUrl)
        icon.kf.indicatorType = .activity
        icon.kf.setImage(
            with: url,
            options: [
                .scaleFactor(UIScreen.main.scale),
                .transition(.fade(1)),
                .cacheOriginalImage
            ])
        nameLabel.text = name
        priceLabel.text = "\(price) руб."
    }

    override func prepareForReuse() {
        super.prepareForReuse()
        icon.image = nil
        nameLabel.text = ""
        priceLabel.text = ""
    }
    
}

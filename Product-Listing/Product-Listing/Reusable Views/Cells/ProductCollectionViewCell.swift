//
//  ProductCollectionViewCell.swift
//  Product-Listing
//
//  Created by Onur Torna on 14.10.2018.
//  Copyright © 2018 Onur Torna. All rights reserved.
//

import UIKit
import Kingfisher

final class ProductCollectionViewCell: UICollectionViewCell {

    @IBOutlet private weak var imageView: UIImageView!
    @IBOutlet private weak var designerName: UILabel!
    @IBOutlet private weak var nameLabel: UILabel!
    @IBOutlet private weak var priceLabel: UILabel!

    static let cellSize = CGSize(width: 120, height: 274)

    func customize(with product: Hit) {
        imageView.downloadImage(path: product.thumbnail ?? "")
        nameLabel.text = product.name
        designerName.text = product.designerCategoryName
        if let price = product.price {
            priceLabel.text = "\(price)"
        }

    }
}

// MARK: - ProductCollectionViewCell
extension ProductCollectionViewCell: NibLoadable { }

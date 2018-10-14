//
//  ProductCollectionViewCell.swift
//  Product-Listing
//
//  Created by Onur Torna on 14.10.2018.
//  Copyright © 2018 Onur Torna. All rights reserved.
//

import UIKit

final class ProductCollectionViewCell: UICollectionViewCell {

    @IBOutlet private weak var designerName: UILabel!
    @IBOutlet private weak var nameLabel: UILabel!
    @IBOutlet private weak var priceLabel: UILabel!

    static let cellHeight: CGFloat = 274

    func customize(with product: Hit) {
        nameLabel.text = product.name
        designerName.text = product.designerCategoryName
        if let price = product.price {
            priceLabel.text = "\(price)"
        }

    }
}

// MARK: - ProductCollectionViewCell
extension ProductCollectionViewCell: NibLoadable { }

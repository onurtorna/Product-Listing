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

    static let cellSize: CGFloat = 274

    override func awakeFromNib() {
        super.awakeFromNib()

        // TODO: Customize views
    }
}

// MARK: - ProductCollectionViewCell
extension ProductCollectionViewCell: NibLoadable { }

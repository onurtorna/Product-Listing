//
//  ProductDetailViewController.swift
//  Product-Listing
//
//  Created by Onur Torna on 15.10.2018.
//  Copyright © 2018 Onur Torna. All rights reserved.
//

import UIKit

final class ProductDetailViewController: UIViewController {

    var viewModel: ProductDetailViewModel!

    @IBOutlet private weak var productImageView: UIImageView!
    @IBOutlet private weak var designerName: UILabel!
    @IBOutlet private weak var nameLabel: UILabel!
    @IBOutlet private weak var priceLabel: UILabel!
    @IBOutlet private weak var addToBagButton: UIButton!

    override func viewDidLoad() {
        super.viewDidLoad()

        applyLocalization()

        viewModel.stateChangeHandler = applyState(_:)
        viewModel.fetchProductDetail()
    }
}

private extension ProductDetailViewController {

    func applyState(_ change: ProductDetailState.Change) {

        switch change {
        case .loading(let isLoading):
            // TODO: Show/hide loading view
            break

        case .error(let receivedError):
            // TODO: Show/hide error view
            break

        case .dataFetch(let product):
            customizeView(with: product)

        }

    }

    func applyLocalization() {
        // TODO: Localise
        addToBagButton.setTitle("ADD TO BAG",
                                for: .normal)
    }

    func customizeView(with product: Hit?) {

        guard let product = product else { return }
        productImageView.downloadImage(path: product.thumbnail ?? "")
        nameLabel.text = product.name
        designerName.text = product.designerCategoryName
        if let price = product.price {
            priceLabel.text = "\(price)"
        }
    }
}

// MARK: - StoryboardLoadable
extension ProductDetailViewController: StoryboardLoadable {

    static var defaultStoryboardName: String {
        return Global.Storyboard.product
    }
}

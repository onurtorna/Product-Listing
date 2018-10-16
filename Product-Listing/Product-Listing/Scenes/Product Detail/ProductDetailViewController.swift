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
    var router: ProductDetailRoutingProtocol!

    @IBOutlet private weak var productImageView: UIImageView!
    @IBOutlet private weak var designerName: UILabel!
    @IBOutlet private weak var nameLabel: UILabel!
    @IBOutlet private weak var priceLabel: UILabel!
    @IBOutlet private weak var addToBagButton: UIButton!

    override func viewDidLoad() {
        super.viewDidLoad()

        applyLocalization()
        initializeNavigationRightButton()

        viewModel.stateChangeHandler = applyState(_:)
        viewModel.fetchProductDetail()

    }
}

// MARK: - Helpers
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

    func initializeNavigationRightButton() {
        // TODO: Localise
        let rightBarButton = UIBarButtonItem(title: "Filter",
                                             style: .done,
                                             target: self,
                                             action: #selector(rightNavigationBarButtonTapped))
        navigationItem.rightBarButtonItem = rightBarButton
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

// MARK: - Actions
private extension ProductDetailViewController {

    @objc func rightNavigationBarButtonTapped() {
        router.viewControllerDidRequestProductDetail(self,
                                                     attributes: viewModel.attributes)
    }
}

// MARK: - ProductFilteringProtocol
extension ProductDetailViewController: ProductFilteringProtocol {

    func viewControllerDidFinishedFiltering(_ viewController: UIViewController,
                                            selectedOptions: [ConfigurableAttributeOption]?) {
        // TODO: Do filtering in view model with selections
        navigationController?.popViewController(animated: true)
    }
}

// MARK: - StoryboardLoadable
extension ProductDetailViewController: StoryboardLoadable {

    static var defaultStoryboardName: String {
        return Global.Storyboard.product
    }
}

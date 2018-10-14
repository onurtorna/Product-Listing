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

    override func viewDidLoad() {
        super.viewDidLoad()

        viewModel.stateChangeHandler = applyState(_:)
        viewModel.fetchProductDetail()
    }
}

private extension ProductDetailViewController {

    func applyState(_ change: ProductDetailState.Change) {

        func applyState(_ change: ProductListState.Change) {

            switch change {
            case .loading(let isLoading):
                // TODO: Show/hide loading view
                break

            case .error(let receivedError):
                // TODO: Show/hide error view
                break

            case .dataFetch:
                // TODO: To be implemented
                break
            }
        }
    }
}

// MARK: - StoryboardLoadable
extension ProductDetailViewController: StoryboardLoadable {

    static var defaultStoryboardName: String {
        return Global.Storyboard.product
    }
}

//
//  ProductDetailViewModel.swift
//  Product-Listing
//
//  Created by Onur Torna on 15.10.2018.
//  Copyright © 2018 Onur Torna. All rights reserved.
//

import Foundation

final class ProductDetailState {

    enum Change {
        case loading(Bool)
        case error(Error?)
        case dataFetch(Hit?)
    }

    /// On change block
    var onChange: ((ProductDetailState.Change) -> Void)?

    /// Slug of the product
    var slug: String

    /// Indicates the current loading state
    var isLoading = false {
        didSet {
            onChange?(.loading(isLoading))
        }
    }

    /// Received error
    var receivedError: Error? {
        didSet {
            onChange?(.error(receivedError))
        }
    }

    var product: Hit? {
        didSet {
            onChange?(.dataFetch(product))
        }
    }

    init(slug: String) {
        self.slug = slug
    }

}

final class ProductDetailViewModel {

    private let dataController: ProductDetailDataProtocol
    private let state: ProductDetailState

    /// State change handler
    var stateChangeHandler: ((ProductDetailState.Change) -> Void)? {
        get {
            return state.onChange
        }

        set {
            state.onChange = newValue
        }
    }

    init(slug: String,
         dataController: ProductDetailDataProtocol) {
        self.dataController = dataController
        state = ProductDetailState(slug: slug)
    }
}

// MARK: - Network
extension ProductDetailViewModel {

    func fetchProductDetail() {

        state.isLoading = true
        dataController.fetchProductDetail(with: state.slug) { [weak self] (hit, error) in

            guard let strongSelf = self else { return }

            strongSelf.state.isLoading = false
            guard error == nil,
                let hit = hit else {
                    strongSelf.state.receivedError = error
                    return
            }

            strongSelf.state.product = hit
        }
    }
}

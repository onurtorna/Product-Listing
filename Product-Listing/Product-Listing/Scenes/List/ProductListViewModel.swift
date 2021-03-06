//
//  ProductListViewModel.swift
//  Product-Listing
//
//  Created by Onur Torna on 14.10.2018.
//  Copyright © 2018 Onur Torna. All rights reserved.
//

import Foundation

/// Contains current state's information
final class ProductListState {

    enum Change {
        case loading(Bool)
        case error(Error?)
        case dataFetch
    }

    /// On change block
    var onChange: ((ProductListState.Change) -> Void)?

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

    var pageNumber = 0

    var hits: [Hit] = [] {
        didSet {
            onChange?(.dataFetch)
        }
    }
}

final class ProductListViewModel {

    private let dataController: ProductListDataProtocol
    private let state = ProductListState()

    /// State change handler
    var stateChangeHandler: ((ProductListState.Change) -> Void)? {
        get {
            return state.onChange
        }

        set {
            state.onChange = newValue
        }
    }

    /// Returns total product count
    var productCount: Int {
        return state.hits.count
    }

    /// Returns product at given index if any
    func product(at index: Int) -> Hit? {
        guard index < state.hits.count else {
                return nil
        }

        return state.hits[index]
    }

    init(dataController: ProductListDataProtocol) {
        self.dataController = dataController
    }

    /// Resets state variables to initial value
    func resetStateAndFetchProducts() {

        state.pageNumber = 0
        fetchProducts(shouldResetState: true)
    }
}

// MARK: - Network
extension ProductListViewModel {

    /// Fetches products with current page number
    func fetchProducts(shouldResetState: Bool = false) {

        state.isLoading = true
        dataController.fetcthProductList(pageNumber: state.pageNumber) { [weak self] (hits, error) in

            guard let strongSelf = self else { return }
            strongSelf.state.isLoading = false
            guard error == nil,
                let hits = hits else {
                strongSelf.state.receivedError = error
                return
            }

            strongSelf.state.pageNumber += 1

            if shouldResetState {
                strongSelf.state.hits = hits
            } else {
                strongSelf.state.hits.append(contentsOf: hits)
            }

        }
    }
}

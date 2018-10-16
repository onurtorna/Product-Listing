//
//  ProductListingTests.swift
//  Product-ListingTests
//
//  Created by Onur Torna on 14.10.2018.
//  Copyright © 2018 Onur Torna. All rights reserved.
//

import XCTest
@testable import ProductListing

private class Box {
    let viewModel: ProductListViewModel
    var state = ProductListState()

    var changeCount = 0

    init(with dataController: ProductListDummyDataController = ProductListDummyDataController()) {
        viewModel = ProductListViewModel(dataController: dataController)
        viewModel.stateChangeHandler = { [unowned self] in
            switch $0 {
            case .dataFetch:
                self.changeCount += 1
            case .error:
                self.changeCount += 1
            case .loading:
                self.changeCount += 1
            }
        }
    }
}

class ProductListingTests: XCTestCase {

    func testStateChangeCount() {

        let box = Box()
        box.viewModel.fetchProducts()
        XCTAssertTrue(box.changeCount == 3)
    }

    func testDataFetch() {
        let box = Box()
        box.viewModel.fetchProducts()
        box.viewModel.fetchProducts()
        box.viewModel.fetchProducts()
        XCTAssertTrue(box.viewModel.productCount == 6)
    }

    func testStateReset() {
        let box = Box()
        box.viewModel.fetchProducts()
        box.viewModel.fetchProducts()
        box.viewModel.fetchProducts()
        box.viewModel.resetStateAndFetchProducts()
        XCTAssertTrue(box.viewModel.productCount == 2)
    }
}

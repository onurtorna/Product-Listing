//
//  ProductDetailTests.swift
//  Product-ListingTests
//
//  Created by Onur Torna on 16.10.2018.
//  Copyright © 2018 Onur Torna. All rights reserved.
//

import XCTest
@testable import ProductListing

private class Box {
    let viewModel: ProductDetailViewModel
    var state = ProductDetailState(slug: "12345")

    var product: Hit?
    var changeCount = 0

    init(with dataController: ProductDetailDummyDataController = ProductDetailDummyDataController()) {
        viewModel = ProductDetailViewModel(slug: "12345",
                                           dataController: dataController)
        viewModel.stateChangeHandler = { [unowned self] in
            switch $0 {
            case .dataFetch(let product):
                self.product = product
                self.changeCount += 1
            case .error:
                self.changeCount += 1
            case .loading:
                self.changeCount += 1
            }
        }
    }
}

class ProductDetailTests: XCTestCase {

    func testDataFetch() {
        let box = Box()
        box.viewModel.fetchProductDetail()
        XCTAssertTrue(box.product?.sku == "12345")
    }

    func testChangeCount() {
        let box = Box()
        box.viewModel.fetchProductDetail()
        XCTAssertTrue(box.changeCount == 3)
    }
}

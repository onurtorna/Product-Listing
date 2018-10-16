//
//  ProductListDummyDataController.swift
//  Product-ListingTests
//
//  Created by Onur Torna on 16.10.2018.
//  Copyright © 2018 Onur Torna. All rights reserved.
//

import Foundation
import XCTest
@testable import ProductListing

class ProductListDummyDataController: ProductListDataProtocol {

    func fetcthProductList(pageNumber: Int,
                           completion: @escaping ([Hit]?, Error?) -> Void) {

        let firstHit = Hit(productId: nil,
                           sku: nil,
                           name: nil,
                           description: nil,
                           designerCategoryName: nil,
                           thumbnail: nil,
                           price: nil,
                           configurableAttributes: [])

        let secondHit = Hit(productId: nil,
                            sku: nil,
                            name: nil,
                            description: nil,
                            designerCategoryName: nil,
                            thumbnail: nil,
                            price: nil,
                            configurableAttributes: [])

        completion([firstHit, secondHit], nil)
    }
}

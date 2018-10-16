//
//  ProductDetailDummyDataController.swift
//  Product-ListingTests
//
//  Created by Onur Torna on 16.10.2018.
//  Copyright © 2018 Onur Torna. All rights reserved.
//

import Foundation
@testable import ProductListing

final class ProductDetailDummyDataController: ProductDetailDataProtocol {

    func fetchProductDetail(with slug: String,
                            completion: @escaping (Hit?, Error?) -> Void) {
        let hit = Hit(productId: nil,
                      sku: slug,
                      name: nil,
                      description: nil,
                      designerCategoryName: nil,
                      thumbnail: nil,
                      price: nil,
                      configurableAttributes: [])
        completion(hit, nil)
    }
}

//
//  ProductDetailDataController.swift
//  Product-Listing
//
//  Created by Onur Torna on 15.10.2018.
//  Copyright © 2018 Onur Torna. All rights reserved.
//

import Foundation

final class ProductDetailDataController: ProductDetailDataProtocol {

    func fetchProductDetail(with slug: String,
                            completion: @escaping (Hit?, Error?) -> Void) {

        APIClient.productDetail(of: slug, completion: completion)
    }
}

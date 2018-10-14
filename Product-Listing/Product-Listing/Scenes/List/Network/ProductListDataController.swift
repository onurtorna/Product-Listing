//
//  ProductListDataController.swift
//  Product-Listing
//
//  Created by Onur Torna on 14.10.2018.
//  Copyright © 2018 Onur Torna. All rights reserved.
//

import Foundation

final class ProductListDataController: ProductListDataProtocol {

    func fetcthProductList(pageNumber: Int = 0,
                           completion: @escaping ([Hit]?, Error?) -> Void) {

        APIClient.productList(with: pageNumber) { (response, error) in
            completion(response?.hits, error)
        }
    }
}

//
//  ProductDetailDataProtocol.swift
//  Product-Listing
//
//  Created by Onur Torna on 15.10.2018.
//  Copyright © 2018 Onur Torna. All rights reserved.
//

import Foundation

protocol ProductDetailDataProtocol {

    /// Fetches product detail with given slug of the product
    ///
    /// - Parameters:
    ///   - slug: Slug of the product
    ///   - completion: Completion block
    func fetchProductDetail(with slug: String,
                            completion: @escaping (Hit?, Error?) -> Void)
}

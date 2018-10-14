//
//  ProductListDataProtocol.swift
//  Product-Listing
//
//  Created by Onur Torna on 14.10.2018.
//  Copyright © 2018 Onur Torna. All rights reserved.
//

import Foundation

protocol ProductListDataProtocol {

    /// Fetches product list with given page number
    ///
    /// - Parameters:
    ///   - pageNumber: Page number to use in pagination
    ///   - completion: Completion block
    func fetcthProductList(pageNumber: Int,
                           completion: @escaping ([Hit]?, Error?) -> Void)
}

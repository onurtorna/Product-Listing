//
//  ProductListRoutingProtocol.swift
//  Product-Listing
//
//  Created by Onur Torna on 15.10.2018.
//  Copyright © 2018 Onur Torna. All rights reserved.
//

import UIKit

protocol ProductListRoutingProtocol {

    /// Navigates to product detail with given sku id of the product
    func viewControllerDidRequestProductDetail(_ viewController: UIViewController,
                                               skuId: String)
}

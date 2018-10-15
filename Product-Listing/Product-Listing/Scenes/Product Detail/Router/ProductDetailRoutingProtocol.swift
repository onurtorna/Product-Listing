//
//  ProductDetailRoutingProtocol.swift
//  Product-Listing
//
//  Created by Onur Torna on 16.10.2018.
//  Copyright © 2018 Onur Torna. All rights reserved.
//

import UIKit

protocol ProductDetailRoutingProtocol {

    /// Triggers when product detail view controller requests filtering
    ///
    /// - Parameter viewController: View Controller
    func viewControllerDidRequestProductDetail(_ viewController: UIViewController)
}

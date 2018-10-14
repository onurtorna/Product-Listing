//
//  ProductListRouter.swift
//  Product-Listing
//
//  Created by Onur Torna on 15.10.2018.
//  Copyright © 2018 Onur Torna. All rights reserved.
//

import UIKit

final class ProductListRouter: ProductListRoutingProtocol {

    func viewControllerDidRequestProductDetail(_ viewController: UIViewController,
                                               skuId: String) {

        let detailViewController = ProductDetailViewController.loadFromStoryboard()
        // TODO: Set view model
        viewController.navigationController?.pushViewController(detailViewController,
                                                                animated: true)
    }
}

//
//  ProductDetailRouter.swift
//  Product-Listing
//
//  Created by Onur Torna on 16.10.2018.
//  Copyright © 2018 Onur Torna. All rights reserved.
//

import UIKit

final class ProductDetailRouter: ProductDetailRoutingProtocol {

    func viewControllerDidRequestProductDetail(_ viewController: UIViewController,
                                               attributes: [ConfigurableAttribute]?) {
        let filterViewController = ProductFilterViewController.loadFromNib()
        filterViewController.viewModel = ProductFilterViewModel(attributes: attributes)
        viewController.navigationController?.pushViewController(filterViewController, animated: true)
    }
}

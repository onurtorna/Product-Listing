//
//  ProductDetailViewController.swift
//  Product-Listing
//
//  Created by Onur Torna on 15.10.2018.
//  Copyright © 2018 Onur Torna. All rights reserved.
//

import UIKit

final class ProductDetailViewController: UIViewController {

    var viewModel: ProductDetailViewModel!

    override func viewDidLoad() {
        super.viewDidLoad()

        // TODO:
    }
}

// MARK: - StoryboardLoadable
extension ProductDetailViewController: StoryboardLoadable {

    static var defaultStoryboardName: String {
        return Global.Storyboard.product
    }
}

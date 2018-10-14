//
//  Hit.swift
//  Product-Listing
//
//  Created by Onur Torna on 14.10.2018.
//  Copyright © 2018 Onur Torna. All rights reserved.
//

import Foundation

struct Hit: Response {

    /// Unique id of the product
    var productId: Int?

    /// Detail url of the product
    var sku: String?

    /// Name of the product
    var name: String?

    /// Description
    var description: String?

    /// Designer's name
    var designerCategoryName: String?

    /// Thumbnail image Url
    var thumbnail: String?

    /// Price of the product
    var price: Int?
}

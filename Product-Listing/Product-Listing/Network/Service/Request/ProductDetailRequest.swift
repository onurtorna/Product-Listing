//
//  ProductDetailRequest.swift
//  Product-Listing
//
//  Created by Onur Torna on 15.10.2018.
//  Copyright © 2018 Onur Torna. All rights reserved.
//

import Alamofire

final class ProductDetailRequest {

    private enum Mapping {
        static let slugKey = "slug"
    }

    static func generateParameters(slug: String) -> Parameters {

        return [Mapping.slugKey: slug]
    }

}

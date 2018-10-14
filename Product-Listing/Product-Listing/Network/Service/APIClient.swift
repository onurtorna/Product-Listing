//
//  APIClient.swift
//  Product-Listing
//
//  Created by Onur Torna on 14.10.2018.
//  Copyright © 2018 Onur Torna. All rights reserved.
//

import Alamofire

final class APIClient {

    static func productList(with pageNumber: Int = 0,
                            completion: @escaping (ProductListResponse?, Error?) -> Void) {

        APIRouter.productList(
            pageNumber: pageNumber).request.responseJSON { (dataResponse) in

            ServiceManager.handleResponse(dataResponse,
                                          of: ProductListResponse.self,
                                          completion: completion)
        }
    }

    static func productDetail(of slug: String,
                              completion: @escaping (Hit?, Error?) -> Void) {

        APIRouter.productDetail(slug: slug).request.responseJSON(completionHandler: { (dataResponse) in

            ServiceManager.handleResponse(dataResponse,
                                          of: Hit.self,
                                          completion: completion)
        })

    }
}

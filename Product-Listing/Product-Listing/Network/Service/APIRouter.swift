//
//  APIRouter.swift
//  Product-Listing
//
//  Created by Onur Torna on 14.10.2018.
//  Copyright © 2018 Onur Torna. All rights reserved.
//

import Alamofire

enum APIRouter {

    case productList(pageNumber: Int)

    case productDetail(slug: String)

    // MARK: - Request
    var request: Alamofire.DataRequest {

        var encodingMethod: ParameterEncoding = URLEncoding.default
        if method == .post {
            encodingMethod = JSONEncoding.default
        }

        return NetworkManager.sessionManager.request(url!,
                                                     method: method,
                                                     parameters: parameters,
                                                     encoding: encodingMethod,
                                                     headers: headers)
    }

    // MARK: - HTTPMethod
    var method: HTTPMethod {

        switch self {
        case .productList,
             .productDetail:
            return .get
        }
    }

    // MARK: - URL
    private var url: URL? {
        let baseUrl = URL(string: "https://www.nisnass.ae")
        let url = baseUrl?.appendingPathComponent(path)
        return url
    }

    // MARK: - HTTPMethod
    private var path: String {

        switch self {
        case .productList:
            return "api/women/clothing"

        case .productDetail:
            return "product/findbyslug"
        }
    }

    /// Mark: Headers
    private var headers: [String: String] {
        // Headers can be added here
        return [:]
    }

    private var parameters: Parameters? {

        switch self {
        case .productList(pageNumber: let pageNumber):
            return CreateAnalysisRequest.generateParameters(pageNumber: pageNumber)

        case .productDetail(slug: let slug):
            return ProductDetailRequest.generateParameters(slug: slug)
        }
    }

}

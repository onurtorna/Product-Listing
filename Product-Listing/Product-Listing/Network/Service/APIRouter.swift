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
        case .productList:
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
    var path: String {

        switch self {
        case .productList:
            return "api/women/clothing"
        }
    }

    /// Mark: Headers
    var headers: [String: String] {
        // TODO: To be implemented
        return [:]
    }

    var parameters: Parameters? {
        switch self {
        // TODO: To be implemented
        case .productList(pageNumber: let pageNumber):
            return nil
        }
    }

}

//
//  ProductListRequest.swift
//  Product-Listing
//
//  Created by Onur Torna on 14.10.2018.
//  Copyright © 2018 Onur Torna. All rights reserved.
//

import Alamofire

final class CreateAnalysisRequest {

    private enum Mapping {
        static let pageNumberKey = "p"
    }

    static func generateParameters(pageNumber: Int) -> Parameters {

        return [Mapping.pageNumberKey: pageNumber]
    }

}

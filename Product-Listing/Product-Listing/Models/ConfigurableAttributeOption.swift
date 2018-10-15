//
//  ConfigurableAttributeOption.swift
//  Product-Listing
//
//  Created by Onur Torna on 16.10.2018.
//  Copyright © 2018 Onur Torna. All rights reserved.
//

import Foundation

struct ConfigurableAttributeOption: Codable {

    /// Unique Id
    var optionId: Int?

    /// Label of the option
    var label: String?

    /// Indicates if available in stock
    var isInStock: Bool?
}

//
//  ConfigurableAttribute.swift
//  Product-Listing
//
//  Created by Onur Torna on 16.10.2018.
//  Copyright © 2018 Onur Torna. All rights reserved.
//

import Foundation

struct ConfigurableAttribute: Codable {

    enum ConfigurationCode: String, Codable {
        case color
        case sizeCode
    }

    /// Code of the configuration
    var code: String?

    /// Options of the configuration
    var options: [ConfigurableAttributeOption]?
}

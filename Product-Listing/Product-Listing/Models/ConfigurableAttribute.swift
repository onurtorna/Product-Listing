//
//  ConfigurableAttribute.swift
//  Product-Listing
//
//  Created by Onur Torna on 16.10.2018.
//  Copyright © 2018 Onur Torna. All rights reserved.
//

import Foundation

struct ConfigurableAttribute: Codable {

    /// Code of the configuration
    var code: ConfigurationCode?

    /// Options of the configuration
    var options: [ConfigurableAttributeOption]?
}

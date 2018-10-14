//
//  UIImageView+Extensions.swift
//  Product-Listing
//
//  Created by Onur Torna on 14.10.2018.
//  Copyright © 2018 Onur Torna. All rights reserved.
//

import UIKit
import Kingfisher

extension UIImageView {

    func downloadImage(baseUrl: String = Network.Url.imageBase,
                       path: String) {
        let url = try? baseUrl.asURL().appendingPathComponent(path)
        kf.setImage(with: url)
    }
}

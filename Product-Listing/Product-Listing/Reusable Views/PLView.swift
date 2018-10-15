//
//  PLView.swift
//  Product-Listing
//
//  Created by Onur Torna on 16.10.2018.
//  Copyright © 2018 Onur Torna. All rights reserved.
//

import UIKit

class PLView: UIView {

    override func awakeAfter(using aDecoder: NSCoder) -> Any? {
        super.awakeAfter(using: aDecoder)

        if subviews.count == 0 {

            let view = type(of: self).loadFromNib()
            view.frame = frame
            view .autoresizingMask = autoresizingMask
            view.translatesAutoresizingMaskIntoConstraints = translatesAutoresizingMaskIntoConstraints

            for constraint in constraints {

                var firstItem = constraint.firstItem
                if let firstItemView = firstItem as? PLView,
                    firstItemView == self {
                    firstItem = view
                }

                var secondItem = constraint.secondItem
                if let secondItemView = secondItem as? PLView,
                    secondItemView == self {
                    secondItem = view
                }

                let constraint = NSLayoutConstraint(item: firstItem ?? PLView(),
                                                    attribute: constraint.firstAttribute,
                                                    relatedBy: constraint.relation,
                                                    toItem: secondItem,
                                                    attribute: constraint.secondAttribute,
                                                    multiplier: constraint.multiplier,
                                                    constant: constraint.constant)
                view.addConstraint(constraint)
            }

            return view
        }

        return self
    }

}

extension PLView: NibLoadable { }

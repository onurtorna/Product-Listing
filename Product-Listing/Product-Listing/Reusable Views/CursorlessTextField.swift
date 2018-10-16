//
//  CursorlessTextField.swift
//  Product-Listing
//
//  Created by Onur Torna on 16.10.2018.
//  Copyright © 2018 Onur Torna. All rights reserved.
//

import UIKit

class CursorlessTextField: UITextField {

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)

        let leftPaddingView = UIView(frame: CGRect(x: 0, y: 0, width: 15.0, height: frame.height))
        leftView = leftPaddingView
        leftViewMode = .always
    }

    override func caretRect(for position: UITextPosition) -> CGRect {
        return .zero
    }
}

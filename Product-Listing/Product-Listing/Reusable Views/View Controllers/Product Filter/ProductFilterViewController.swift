//
//  ProductFilterViewController.swift
//  Product-Listing
//
//  Created by Onur Torna on 16.10.2018.
//  Copyright © 2018 Onur Torna. All rights reserved.
//

import UIKit

protocol ProductFilteringProtocol: class {

    // TODO: Embed selections into one model
    func viewControllerDidFinishedFiltering(_ viewController: UIViewController,
                                            sizeSelection: ConfigurableAttributeOption?,
                                            colorSelection: ConfigurableAttributeOption?)
}

final class ProductFilterViewController: UIViewController {

    @IBOutlet private weak var colorPickerView: PickerView!
    @IBOutlet private weak var sizePickerView: PickerView!

    var viewModel: ProductFilterViewModel!

    weak var delegate: ProductFilteringProtocol?

    override func viewDidLoad() {
        super.viewDidLoad()

        viewModel.stateChangeHandler = applyState(_:)
    }

}

// MARK: - Helpers
private extension ProductFilterViewController {

    func applyState(_ change: ProductFilterState.Change) {

        switch change {
        case .initialPublish(size: let sizeAttribute,
                             color: let colorAttribute):

            if let sizeAttribute = sizeAttribute {
                sizePickerView.configuration = sizeAttribute
                sizePickerView.delegate = self
            } else {
                sizePickerView.isHidden = true
            }

            if let colorAttribute = colorAttribute {
                colorPickerView.configuration = colorAttribute
                colorPickerView.delegate = self
            } else {
                colorPickerView.isHidden = true
            }
        }
    }
}

// MARK: - Actions
private extension ProductFilterViewController {

    @IBAction func filterButtonTapped(_ sender: Any) {
        delegate?.viewControllerDidFinishedFiltering(self,
                                                     sizeSelection: viewModel.selectedSize,
                                                     colorSelection: viewModel.selectedColor)
    }
}

// MARK: - PickerViewDelegate
extension ProductFilterViewController: PickerViewDelegate {

    func pickerViewDidSelectItem(_ view: PickerView,
                                 selectedItem: ConfigurableAttributeOption) {

        if view == sizePickerView {
            
        } else if view == colorPickerView {

        }
    }
}

// MARK: - NibLoadable
extension ProductFilterViewController: NibLoadable { }

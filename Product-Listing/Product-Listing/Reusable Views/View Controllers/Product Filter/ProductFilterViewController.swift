//
//  ProductFilterViewController.swift
//  Product-Listing
//
//  Created by Onur Torna on 16.10.2018.
//  Copyright © 2018 Onur Torna. All rights reserved.
//

import UIKit

protocol ProductFilteringProtocol: class {

    func viewControllerDidFinishedFiltering(_ viewController: UIViewController,
                                            selectedOptions: [ConfigurableAttributeOption]?)
}

final class ProductFilterViewController: UIViewController {

    @IBOutlet private weak var optionHolderStackView: UIStackView!
    
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
        case .initialPublish(attributes: let attributes):
            prepareFilterOptions(with: attributes)

        }
    }

    func prepareFilterOptions(with attributes: [ConfigurableAttribute]?) {

        guard let attributes = attributes else { return }

        for attribute in attributes {

            let pickerView = PickerView.loadFromNib()
            pickerView.configuration = attribute
            optionHolderStackView.addArrangedSubview(pickerView)
        }
    }
}

// MARK: - Actions
private extension ProductFilterViewController {

    @IBAction func filterButtonTapped(_ sender: Any) {
        // TODO: To be implemented
    }
}

// MARK: - PickerViewDelegate
extension ProductFilterViewController: PickerViewDelegate {

    func pickerViewDidSelectItem(_ view: PickerView,
                                 configurationCode: ConfigurationCode,
                                 selectedOption: ConfigurableAttributeOption) {

        viewModel.updateSelectedOption(for: configurationCode,
                                       option: selectedOption)
    }
}

// MARK: - NibLoadable
extension ProductFilterViewController: NibLoadable { }

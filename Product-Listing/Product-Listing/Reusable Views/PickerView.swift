//
//  OptionPickerView.swift
//  Product-Listing
//
//  Created by Onur Torna on 16.10.2018.
//  Copyright © 2018 Onur Torna. All rights reserved.
//

import UIKit

protocol PickerViewDelegate: class {

    func pickerViewDidSelectItem(_ view: PickerView,
                                 configurationCode: String,
                                 selectedOption: ConfigurableAttributeOption)
}

// TODO: Rename to option picker view
final class PickerView: PLView {

    @IBOutlet private weak var textField: CursorlessTextField!

    private let pickerView = UIPickerView()

    var configuration: ConfigurableAttribute! {
        didSet {
            textField.placeholder = configuration.code
        }
    }

    weak var delegate: PickerViewDelegate?

    override func awakeFromNib() {
        super.awakeFromNib()

        layer.cornerRadius = 8.0
        layer.borderColor = UIColor.black.cgColor
        layer.borderWidth = 1.0

        preparePickerView()
    }
}

extension PickerView {

    func preparePickerView() {

        let toolbar = UIToolbar()
        toolbar.sizeToFit()
        // TODO: Localize
        let spaceButton = UIBarButtonItem(barButtonSystemItem: UIBarButtonItem.SystemItem.flexibleSpace,
                                          target: nil,
                                          action: nil)
        let doneButton = UIBarButtonItem(title: "Ok",
                                         style: UIBarButtonItem.Style.done,
                                         target: self,
                                         action: #selector(selectItem))
        toolbar.setItems([spaceButton, doneButton], animated: false)

        textField.inputAccessoryView = toolbar
        
        pickerView.dataSource = self
        pickerView.delegate = self
        pickerView.backgroundColor = .white
        textField.inputView = pickerView
    }
}

// MARK: - Actions
private extension PickerView {

    @objc func selectItem() {

        let row = pickerView.selectedRow(inComponent: 0)
        if let option = configuration.options?[row],
            let code = configuration.code {
            textField.text = option.label
            delegate?.pickerViewDidSelectItem(self,
                                              configurationCode: code,
                                              selectedOption: option)
        }
        endEditing(true)
    }
}

// MARK: - UIPickerViewDelegate
extension PickerView: UIPickerViewDelegate {

    func pickerView(_ pickerView: UIPickerView,
                    viewForRow row: Int,
                    forComponent component: Int,
                    reusing view: UIView?) -> UIView {

        var pickerLabel = view as? UILabel

        if pickerLabel == nil {

            pickerLabel = UILabel()
            pickerLabel?.textColor = .black
            pickerLabel?.textAlignment = .center
        }

        pickerLabel?.text = configuration.options?[row].label
        return pickerLabel ?? UILabel()
    }
}

// MARK: - UIPickerViewDataSource
extension PickerView: UIPickerViewDataSource {

    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }

    func pickerView(_ pickerView: UIPickerView,
                    numberOfRowsInComponent component: Int) -> Int {
        return configuration.options?.count ?? 0
    }
}

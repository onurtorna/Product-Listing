//
//  ProductFilterViewModel.swift
//  Product-Listing
//
//  Created by Onur Torna on 16.10.2018.
//  Copyright © 2018 Onur Torna. All rights reserved.
//

import Foundation

final class ProductFilterState {

    enum Change {
        case initialPublish(attributes: [ConfigurableAttribute]?)
        case applyFiltering([String: ConfigurableAttributeOption])
    }

    /// On change block
    var onChange: ((ProductFilterState.Change) -> Void)?

    /// Attributes of the product
    var attributes: [ConfigurableAttribute]?

    /// Selected options in filtering
    var selectedOptions: [String: ConfigurableAttributeOption] = [:]

    init(attributes: [ConfigurableAttribute]?) {
        self.attributes = attributes
    }
}

final class ProductFilterViewModel {

    private let state: ProductFilterState

    /// State change handler
    var stateChangeHandler: ((ProductFilterState.Change) -> Void)? {
        get {
            return state.onChange
        }

        set {
            state.onChange = newValue
            state.onChange?(.initialPublish(attributes: state.attributes))
        }
    }

    init(attributes: [ConfigurableAttribute]?) {
        state = ProductFilterState(attributes: attributes)
    }

    func updateSelectedOption(`for` code: String,
                              option: ConfigurableAttributeOption) {
        state.selectedOptions[code] = option
    }

    func applyFiltering() {
        stateChangeHandler?(.applyFiltering(state.selectedOptions))
    }
}

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
        case initialPublish(size: ConfigurableAttribute?, color: ConfigurableAttribute?)
    }

    /// On change block
    var onChange: ((ProductFilterState.Change) -> Void)?

    /// Attributes of the product
    var attributes: [ConfigurableAttribute]?

    var selectedColorOption: ConfigurableAttributeOption?
    var selectedSizeOption: ConfigurableAttributeOption?

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
            let colorAttribute = state.attributes?.filter { return ($0.code)! == .color }.first
            let sizeAttribute = state.attributes?.filter { return ($0.code)! == .sizeCode }.first
            state.onChange?(.initialPublish(size: sizeAttribute, color: colorAttribute))
        }
    }

    init(attributes: [ConfigurableAttribute]?) {
        state = ProductFilterState(attributes: attributes)
    }

    func updateSelectedSize(option: ConfigurableAttributeOption?) {
        state.selectedSizeOption = option
    }

    func updateSelectedColor(option: ConfigurableAttributeOption?) {
        state.selectedColorOption = option
    }
}

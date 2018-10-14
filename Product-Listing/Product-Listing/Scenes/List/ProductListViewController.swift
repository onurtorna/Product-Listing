//
//  ProductListViewController.swift
//  Product-Listing
//
//  Created by Onur Torna on 14.10.2018.
//  Copyright © 2018 Onur Torna. All rights reserved.
//

import UIKit
import UKPullToRefresh

class ProductListViewController: UIViewController {

    private enum Constant {
        static let collectionViewCellPadding: CGFloat = 20.0
    }

    @IBOutlet private weak var collectionView: UICollectionView!

    var viewModel = ProductListViewModel(dataController: ProductListDataController())

    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        collectionView.collectionViewLayout.invalidateLayout()
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        collectionView.delegate = self
        collectionView.dataSource = self

        collectionView.register(ProductCollectionViewCell.defaultNib,
                                forCellWithReuseIdentifier: ProductCollectionViewCell.defaultNibName)

        viewModel.stateChangeHandler = applyState(_:)
        viewModel.fetchProducts()

        collectionView.addPullToRefresh(to: .bottom) { [unowned self] () -> Void in
            self.viewModel.fetchProducts()
            self.collectionView.pullToRefreshView.state = .stopped
        }
    }
}

// MARK: - Helpers
private extension ProductListViewController {

    func applyState(_ change: ProductListState.Change) {

        switch change {
        case .dataFetch:
            collectionView.reloadData()
        }
    }
}

// MARK: - UICollectionViewDelegateFlowLayout
extension ProductListViewController: UICollectionViewDelegateFlowLayout {

    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: view.frame.size.width / 2 - (Constant.collectionViewCellPadding * 2),
                      height: ProductCollectionViewCell.cellHeight)
    }

    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: Constant.collectionViewCellPadding,
                            left: Constant.collectionViewCellPadding,
                            bottom: Constant.collectionViewCellPadding,
                            right: Constant.collectionViewCellPadding)
    }
}

// MARK: - UICollectionViewDataSource
extension ProductListViewController: UICollectionViewDataSource {

    func collectionView(_ collectionView: UICollectionView,
                        numberOfItemsInSection section: Int) -> Int {
        return viewModel.productCount
    }

    func collectionView(_ collectionView: UICollectionView,
                        cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if let cell = collectionView.dequeueReusableCell(
            withReuseIdentifier: ProductCollectionViewCell.defaultNibName,
            for: indexPath) as? ProductCollectionViewCell,
            let product = viewModel.product(at: indexPath.row) {
            cell.customize(with: product)
            return cell
        }

        return UICollectionViewCell()
    }
}

// MARK: - StoryboardLoadable
extension ProductListViewController: StoryboardLoadable {

    static var defaultStoryboardName: String {
        return Global.Storyboard.product
    }
}

//
//  ProductListViewController.swift
//  Product-Listing
//
//  Created by Onur Torna on 14.10.2018.
//  Copyright © 2018 Onur Torna. All rights reserved.
//

import UIKit

class ProductListViewController: UIViewController {

    private enum Constant {
        static let collectionViewCellPadding: CGFloat = 20.0
    }

    @IBOutlet private weak var collectionView: UICollectionView!

    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        collectionView.collectionViewLayout.invalidateLayout()
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        collectionView.dataSource = self

        collectionView.register(ProductCollectionViewCell.defaultNib,
                                forCellWithReuseIdentifier: ProductCollectionViewCell.defaultNibName)
    }
}

// MARK: - UICollectionViewDelegateFlowLayout
extension ProductListViewController: UICollectionViewDelegateFlowLayout {

    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: view.frame.size.width / 2 - (Constant.collectionViewCellPadding * 2),
                      height: ProductCollectionViewCell.cellSize)
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
        return 5
    }

    func collectionView(_ collectionView: UICollectionView,
                        cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if let cell = collectionView.dequeueReusableCell(
            withReuseIdentifier: ProductCollectionViewCell.defaultNibName,
            for: indexPath) as? ProductCollectionViewCell {
            // TODO:
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

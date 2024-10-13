//
//  ProductsCollectionDelegate.swift
//  TestDigio
//
//  Created by Pedro Brandão on 12/10/24.
//

import UIKit

protocol ProductsCollectionDelegating: UICollectionViewDelegate, UICollectionViewDataSource {
}

class ProductsCollectionDelegate: NSObject {
}

extension ProductsCollectionDelegate: ProductsCollectionDelegating {
}

extension ProductsCollectionDelegate: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        1
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        UICollectionViewCell()
    }
}

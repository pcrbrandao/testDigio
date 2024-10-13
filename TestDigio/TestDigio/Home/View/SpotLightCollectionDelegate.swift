//
//  SpotLightCollectionDelegate.swift
//  TestDigio
//
//  Created by Pedro Brandão on 12/10/24.
//

import UIKit

protocol SpotLightCollectionDelegating: UICollectionViewDelegate {
}

protocol SpotLightDataGetting: AnyObject {
    func numberOfItemsInSection(_ section: Int) -> Int
    func urlImageAt(indexPath: IndexPath) -> String
}

class SpotLightCollectionDelegate: NSObject, SpotLightCollectionDelegating {
}

extension SpotLightCollectionDelegate: UICollectionViewDelegate {
}

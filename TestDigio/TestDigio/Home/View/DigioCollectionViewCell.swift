//
//  DigioCollectionViewCell.swift
//  TestDigio
//
//  Created by Pedro Brandão on 12/10/24.
//

import SDWebImage
import UIKit

class DigioCollectionViewCell: UICollectionViewCell {
    @IBOutlet weak private var imageView: UIImageView!
    
    func updateURL(_ url: String) {
        imageView.sd_setImage(with: URL(string: url))
    }
}

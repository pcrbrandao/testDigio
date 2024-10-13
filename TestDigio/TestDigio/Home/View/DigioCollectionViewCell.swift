//
//  DigioCollectionViewCell.swift
//  TestDigio
//
//  Created by Pedro Brandão on 12/10/24.
//

import SDWebImage
import UIKit

protocol TapImageHandling: AnyObject {
    func handleTapOnModel(_ model: Codable?)
}

class DigioCollectionViewCell: UICollectionViewCell {
    private var model: Codable?
    private var tapHandler: TapImageHandling?
    
    @IBOutlet weak private var imageView: UIImageView!
    
    func updateURL(_ url: String) {
        imageView.sd_setImage(with: URL(string: url))
    }
    
    func setModel(_ model: Codable) {
        self.model = model
    }
    
    func setTapHandler(_ handler: TapImageHandling?) {
        self.tapHandler = handler
    }
}

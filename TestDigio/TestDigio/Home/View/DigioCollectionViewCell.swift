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
    @IBOutlet weak private var roundAndShadeView: UIView!
    
    func updateURL(_ url: String) {
        imageView.sd_setImage(with: URL(string: url))
        if imageView.gestureRecognizers?.isEmpty ?? true {
            let tap = UITapGestureRecognizer(target: self, action: #selector(tapOnImageAction))
            imageView.addGestureRecognizer(tap)
        }
        
        imageView.layer.masksToBounds = false
        imageView.layer.cornerRadius = 10
        imageView.clipsToBounds = true
        
        setShadows(on: roundAndShadeView)
    }
    
    private func setShadows(on view: UIView) {
        view.layer.cornerRadius = 10
        view.layer.masksToBounds = true
        view.layer.shadowColor = UIColor.black.cgColor
        view.layer.masksToBounds = false
        view.clipsToBounds = false
        view.layer.shadowOpacity = 0.3
        view.layer.shadowOffset = CGSize(width: -1, height: 1)
        view.layer.shadowRadius = 5
    }
    
    func setModel(_ model: Codable) {
        self.model = model
    }
    
    func setTapHandler(_ handler: TapImageHandling?) {
        self.tapHandler = handler
    }
    
    @objc private func tapOnImageAction() {
        tapHandler?.handleTapOnModel(model)
    }
}

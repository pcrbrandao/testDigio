//
//  UIView+Extension.swift
//  TestDigio
//
//  Created by Pedro Brandão on 13/10/24.
//

import UIKit

extension UIView {
    func setShadows() {
        self.layer.cornerRadius = 10
        self.layer.masksToBounds = true
        self.layer.shadowColor = UIColor.black.cgColor
        self.layer.masksToBounds = false
        self.clipsToBounds = false
        self.layer.shadowOpacity = 0.3
        self.layer.shadowOffset = CGSize(width: -1, height: 1)
        self.layer.shadowRadius = 5
    }
}

extension UIImageView {
    func round() {
        self.layer.masksToBounds = false
        self.layer.cornerRadius = 10
        self.clipsToBounds = true
    }
}

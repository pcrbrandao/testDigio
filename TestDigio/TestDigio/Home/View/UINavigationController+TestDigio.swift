//
//  UINavigationController+TestDigio.swift
//  TestDigio
//
//  Created by Pedro Brandão on 12/10/24.
//

import UIKit

protocol Navigatable: AnyObject {
    func performSegue(with identifier: String)
}

extension UIViewController: Navigatable {
    func performSegue(with identifier: String) {
        performSegue(withIdentifier: identifier, sender: self)
    }
}

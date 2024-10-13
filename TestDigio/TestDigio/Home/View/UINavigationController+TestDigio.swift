//
//  UINavigationController+TestDigio.swift
//  TestDigio
//
//  Created by Pedro Brandão on 12/10/24.
//

import UIKit

protocol Navigatable: AnyObject {
}

protocol Navigating: AnyObject {
    func push(_ navigatable: Navigatable)
}

extension UINavigationController: Navigating {
    func push(_ navigatable: any Navigatable) {
        guard let vc = navigatable as? UIViewController else {
            return
        }
        if self.viewControllers.contains(vc) {
            popToViewController(vc, animated: true)
        }
        pushViewController(vc, animated: true)
    }
}

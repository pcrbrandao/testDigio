//
//  TestDigioCoordinator.swift
//  TestDigio
//
//  Created by Pedro Brandão on 12/10/24.
//

import Foundation

protocol TestDigioDataProtocol: AnyObject {
    var data: TestDigioModel? { get set }
}

protocol TestDigioCoordinating: AnyObject {
    func goToDetail()
}

class TestDigioCoordinator {
    var data: TestDigioModel?
    
    let navigator: Navigating
    
    init(data: TestDigioModel? = nil, navigator: Navigating) {
        self.data = data
        self.navigator = navigator
    }
}

extension TestDigioCoordinator: TestDigioCoordinating {
    func goToDetail() {
        // TODO: Implement
    }
}

extension TestDigioCoordinator: TestDigioDataProtocol {
}

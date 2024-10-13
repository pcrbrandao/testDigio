//
//  HomeCoordinator.swift
//  TestDigio
//
//  Created by Pedro Brandão on 12/10/24.
//

import Foundation

protocol TestDigioDataProtocol: AnyObject {
    var data: TestDigioModel? { get set }
}

protocol HomeCoordinating: AnyObject {
    func goToDetail(from model: Codable?)
    func goToCashDetail()
}

class HomeCoordinator {
    var data: TestDigioModel?
    
    let navigator: Navigating
    
    init(data: TestDigioModel? = nil, navigator: Navigating) {
        self.data = data
        self.navigator = navigator
    }
}

extension HomeCoordinator: HomeCoordinating {
    func goToDetail(from model: Codable?) {
        switch model {
        case is SpotLightModel:
            print("spotLight tap")
        case is ProductModel:
            print("product tap")
        default:
            print("not handlable tap")
        }
    }
    
    func goToCashDetail() {
        print("cash tap")
    }
}

extension HomeCoordinator: TestDigioDataProtocol {
}

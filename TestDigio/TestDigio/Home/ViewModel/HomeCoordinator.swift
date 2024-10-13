//
//  HomeCoordinator.swift
//  TestDigio
//
//  Created by Pedro Brandão on 12/10/24.
//

import Foundation
import UIKit

protocol TestDigioDataProtocol: AnyObject {
    var data: TestDigioModel? { get set }
}

protocol HomeCoordinating: AnyObject {
    func goToDetail(from model: Codable?)
    func goToCashDetail()
    func prepareToSegue(with destination: Navigatable)
}

class HomeCoordinator: TestDigioDataProtocol {
    var data: TestDigioModel?
    
    private let navigator: Navigatable
    private let detailSegueId = "detailSegue"
    private var selectedModel: Codable?
    
    init(data: TestDigioModel? = nil, navigator: Navigatable) {
        self.data = data
        self.navigator = navigator
    }
    
    private func goToDetail() {
        if let nav = navigator as? UIViewController {
            nav.performSegue(withIdentifier: detailSegueId, sender: nil)
        }
    }
}

extension HomeCoordinator: HomeCoordinating {
    func goToDetail(from model: Codable?) {
        selectedModel = model
        goToDetail()
    }
    
    func goToCashDetail() {
        selectedModel = data?.cash
        goToDetail()
    }
    
    func prepareToSegue(with destination: any Navigatable) {
        guard let viewController = destination as? DetailViewProtocol else {
            return
        }
        if let model = selectedModel as? SpotLightModel {
            viewController.model = DetailModel(title: model.name, url: model.bannerURL, decription: model.description)
        }
        if let model = selectedModel as? ProductModel {
            viewController.model = DetailModel(title: model.name, url: model.imageURL, decription: model.description)
        }
        if let model = selectedModel as? CashModel {
            viewController.model = DetailModel(title: model.title, url: model.bannerURL, decription: model.description)
        }
    }
}

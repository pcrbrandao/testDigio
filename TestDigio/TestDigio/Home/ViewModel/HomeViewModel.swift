//
//  HomeViewModel.swift
//  TestDigio
//
//  Created by Pedro Brandão on 12/10/24.
//

import Combine
import Foundation

protocol HomeViewModelProtocol: SpotLightDataGetting {
    func handleViewDidLoad()
    
    var newSpotLightDataSub: PassthroughSubject<[TestDigioModel], Never> { get }
    var newProductsDataSub: PassthroughSubject<[TestDigioModel], Never> { get }
    var newCashDataSub: PassthroughSubject<TestDigioModel, Never> { get }
}

class HomeViewModel {
    var newSpotLightDataSub = PassthroughSubject<[TestDigioModel], Never>()
    var newProductsDataSub = PassthroughSubject<[TestDigioModel], Never>()
    var newCashDataSub = PassthroughSubject<TestDigioModel, Never>()
    
    private var navigation: Navigating?
    
    init(navigation: Navigating?) {
        self.navigation = navigation
    }
}

extension HomeViewModel: HomeViewModelProtocol {
    
    func handleViewDidLoad() {
        // TODO: implement
        let m1 = TestDigioModel(url: "https://s3-sa-east-1.amazonaws.com/digio-exame/recharge_banner.png")
        let m2 = TestDigioModel(url: "https://s3-sa-east-1.amazonaws.com/digio-exame/uber_banner.png")
        newSpotLightDataSub.send([m1, m2])
    }
}

extension HomeViewModel: SpotLightDataGetting {
    func numberOfItemsInSection(_ section: Int) -> Int {
        1
    }
    
    func urlImageAt(indexPath: IndexPath) -> String {
        ""
    }
}

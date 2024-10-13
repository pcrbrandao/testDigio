//
//  HomeViewModel.swift
//  TestDigio
//
//  Created by Pedro Brandão on 12/10/24.
//

import Foundation

protocol HomeViewModelProtocol: SpotLightDataGetting {
    func handleViewDidLoad()
}

class HomeViewModel {
    private var navigation: Navigating?
    
    init(navigation: Navigating?) {
        self.navigation = navigation
    }
}

extension HomeViewModel: HomeViewModelProtocol {
    func handleViewDidLoad() {
        // TODO: implement
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

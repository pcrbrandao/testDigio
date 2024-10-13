//
//  HomeViewModel.swift
//  TestDigio
//
//  Created by Pedro Brandão on 12/10/24.
//

import Combine
import Foundation

protocol HomeViewModelProtocol: AnyObject {
    func handleViewDidLoad()
    
    var newSpotLightDataSub: PassthroughSubject<[SpotLightModel], Never> { get }
    var newProductsDataSub: PassthroughSubject<[ProductModel], Never> { get }
    var newCashDataSub: PassthroughSubject<CashModel, Never> { get }
}

class HomeViewModel {
    var newSpotLightDataSub = PassthroughSubject<[SpotLightModel], Never>()
    var newProductsDataSub = PassthroughSubject<[ProductModel], Never>()
    var newCashDataSub = PassthroughSubject<CashModel, Never>()
    
    private var navigation: Navigating?
    private var service: TestDigioServiceProtocol?
    private var cancellables: [AnyCancellable] = []
    
    init(navigation: Navigating?, service: TestDigioServiceProtocol? = TestDigioService()) {
        self.navigation = navigation
        self.service = service
    }
}

extension HomeViewModel: HomeViewModelProtocol {
    
    func handleViewDidLoad() {
        service?.fechData()
            .receive(on: DispatchQueue.main)
            .sink(receiveCompletion: { completion in
                switch completion {
                case .finished:
                    print("received data done")
                case .failure(let error):
                    print("error feching data: \(error)")
                }
            }, receiveValue: { model in
                self.newSpotLightDataSub.send(model.spotlight)
                self.newCashDataSub.send(model.cash)
                self.newProductsDataSub.send(model.products)
            })
            .store(in: &cancellables)
    }
}

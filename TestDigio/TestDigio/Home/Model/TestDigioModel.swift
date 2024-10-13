//
//  TestDigioModel.swift
//  TestDigio
//
//  Created by Pedro Brandão on 12/10/24.
//

import Foundation

struct TestDigioModel: Codable {
    let spotlight: [SpotLightModel]
    let products: [ProductModel]
    let cash: CashModel
}

struct SpotLightModel: Codable {
    let serialNumber: String?
    let name: String
    let bannerURL: String
    let description: String
}

extension SpotLightModel: Hashable {
    static func == (lhs: SpotLightModel, rhs: SpotLightModel) -> Bool {
        lhs.bannerURL == rhs.bannerURL
    }
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(serialNumber)
    }
}

struct ProductModel: Codable {
    let serialNumber: String?
    let name: String
    let imageURL: String
    let description: String
}

extension ProductModel: Hashable {
    static func == (lhs: ProductModel, rhs: ProductModel) -> Bool {
        lhs.imageURL == rhs.imageURL
    }
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(serialNumber)
    }
}

struct CashModel: Codable {
    let title: String
    let bannerURL: String
    let description: String
}

struct DetailModel {
    let title: String
    let url: String
    let decription: String
}

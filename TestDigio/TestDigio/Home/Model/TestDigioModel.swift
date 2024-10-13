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
    
    static func parse(_ data: Data) -> TestDigioModel? {
        do {
            let model = try JSONDecoder().decode(TestDigioModel.self, from: data)
            return model
        } catch {
            print("Decode error: \(error)")
            return nil
        }
    }
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
    
    init(title: String, url: String, decription: String) {
        self.title = title
        self.url = url
        self.decription = decription
    }
    
    init(with model: SpotLightModel) {
        self.init(title: model.name, url: model.bannerURL, decription: model.description)
    }
    
    init(with model: ProductModel) {
        self.init(title: model.name, url: model.imageURL, decription: model.description)
    }
    
    init(with model: CashModel) {
        self.init(title: model.title, url: model.bannerURL, decription: model.description)
    }
    
    init(with codable: Codable) {
        if let model = codable as? SpotLightModel {
            self.init(with: model)
            return
        }
        if let model = codable as? ProductModel {
            self.init(with: model)
            return
        }
        if let model = codable as? CashModel {
            self.init(with: model)
            return
        }
        self.init(title: "", url: "", decription: "")
    }
}

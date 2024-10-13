//
//  TestDigioModel.swift
//  TestDigio
//
//  Created by Pedro Brandão on 12/10/24.
//

import Foundation

protocol TestDigioModelProtocol: Codable {
    var url: String { get set }
}

class TestDigioModel: Codable {
    var serialNumber: String
    var url: String
    
    init(url: String, serial: String = "") {
        self.url = url
        self.serialNumber = serial
    }
}

extension TestDigioModel: Hashable {
    static func == (lhs: TestDigioModel, rhs: TestDigioModel) -> Bool {
        lhs.url == rhs.url
    }
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(serialNumber)
    }
}

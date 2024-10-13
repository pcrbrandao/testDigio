//
//  TestDigioService.swift
//  TestDigio
//
//  Created by Pedro Brandão on 12/10/24.
//

import Combine
import Foundation

protocol TestDigioServiceProtocol: AnyObject {
    func fechData() -> AnyPublisher<TestDigioModel, Error>
}

class TestDigioService: TestDigioServiceProtocol {
    func fechData() -> AnyPublisher<TestDigioModel, any Error> {
        Future<TestDigioModel, Error> { promise in
            let urlError = NSError(domain: "Invalid URL", code: 0)
            guard let url = URL(string: "https://7hgi9vtkdc.execute-api.sa-east-1.amazonaws.com/sandbox/products") else {
                promise(Result.failure(urlError))
                return
            }
            let task = URLSession.shared.dataTask(with: url) { data, _, error in
                if let error = error {
                    promise(Result.failure(error))
                    return
                }
                if let data = data, let model = self.parse(data) {
                    promise(.success(model))
                    return
                }
                let parseError = NSError(domain: "Invalid data", code: 1)
                promise(.failure(parseError))
            }
            task.resume()
        }
        .eraseToAnyPublisher()
    }
    
    private func parse(_ data: Data) -> TestDigioModel? {
        do {
            let model = try JSONDecoder().decode(TestDigioModel.self, from: data)
            return model
        } catch {
            print("Decode error: \(error)")
            return nil
        }
    }
}

//
//  Webservice.swift
//  Aktuel
//
//  Created by Turan Çabuk on 28.11.2022.
//

import Foundation

protocol WebserviceProtocol {
    func updateProducts(_ Webservice: WebService, )
}
final class WebService: WebServiceProtocol {
    func fetch<T: Codable>(response: T.Type, with path: NewsAPICall, completion: @escaping (Result<T, Error>) -> Void) {
        let urlRequest = URLRequest(url: path.url)
        let task = URLSession.shared.dataTask(with: urlRequest) {data, _, error in
            if let error = error {
                completion(.failure(error))
                return
            }

            guard let data = data else {
                completion(.failure(NetworkError.dataNotFound))
                return
            }

            let decoder = JSONDecoder()
            do {
                let response = try decoder.decode(T.self, from: data)
                completion(.success(response))
            } catch {
                completion(.failure(error))
            }
        }
        task.resume()
    }
}

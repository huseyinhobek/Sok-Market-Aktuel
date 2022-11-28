//
//  Webservice.swift
//  Aktuel
//
//  Created by Turan Çabuk on 28.11.2022.
//

import Foundation

protocol WebserviceProtocol {
    func fetch<T: Codable>(response: T.Type, with path: AktuelAPICall, completion: @escaping (Result <T, Error>) -> Void)
}
final class WebService: WebserviceProtocol {
    func fetch<T>(response: T.Type, with path: AktuelAPICall, completion: @escaping (Result<T, Error>) -> Void) where T : Decodable, T : Encodable {
        let urlRequest = URLRequest(url: path.url)
        let task = URLSession.shared.dataTask(with: urlRequest) { data, response, error in
            if let error = error {
                completion(.failure(error))
                return
            }
            guard let data = data else {
                completion(.failure(NetworkError.dataNotFound))
                return
            }
            let decoder = JSONDecoder()
            do{
                let response = try decoder.decode(T.self, from: data)
                completion(.success(response))
            }catch{
                completion(.failure(error))
            }
        }
        task.resume()
    }
}
enum NetworkError: Error{
    case dataNotFound
}

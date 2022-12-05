//
//  MainViewModel.swift
//  Aktuel
//  Created by Hüseyin HÖBEK on 29.11.2022.

import Foundation




final class MainViewModel {
    
    var productList = [Product]()
    private let webService: WebserviceProtocol = WebService()
    
   
    func getProducts(completion: @escaping (Result<Aktuel, Error>) -> Void) {
        
        webService.fetch(response: Aktuel.self, with: .getAktuel, completion: { result in
            switch result {
            case .success(let response):
                if let products = response.payload?.products {
                    self.productList = products
                }
                completion(result)
            case .failure(let error):
                print(error)
            }
            
        })

        
    }
    
}






















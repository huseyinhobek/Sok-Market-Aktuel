//
//  MainViewModel.swift
//  Aktuel
//  Created by Hüseyin HÖBEK on 29.11.2022.

import Foundation
import UIKit




final class MainViewModel {
    
    var productList = [Product]()
    var categoryList: [String] = []
    var categoryArray: [String] = []
    var uniqeArray: [String] = []
    var categories: [String] = []
    var productsInCategory: [Product] = []
    
    
    
    
    private let webService: WebserviceProtocol = WebService()
    
    
    func getProducts(completion: @escaping (Result<Aktuel, Error>) -> Void) {
        
        webService.fetch(response: Aktuel.self, with: .getAktuel, completion: { result in
            switch result {
            case .success(let response):
                if let products = response.payload?.products{
                    
                    ///// Burada .map veya .filter high order function lari kullanarak category dizisi oluşturulacak.
                    
                    self.productList = products
                    self.categoryList = Array(Set(products.map{ $0.categoryBreadcrumb! }))
                    
                    for category in self.categoryList {
                        let string = category.components(separatedBy: "/")[0]
                        self.categoryArray.append(string)
                        
                        let nonEmptyCategories = self.categoryArray.filter { !$0.isEmpty }
                        let categorySet = Set(self.categoryArray)
                        self.categories.append(contentsOf: nonEmptyCategories)
                        
                        self.categories = Array(categorySet)
                        print(self.categories)
                        print(self.categories.count)
                        
                    }
                    
                }
                completion(result)
            case .failure(let error):
                print(error)
            }
            
        })
        
    }
    
}

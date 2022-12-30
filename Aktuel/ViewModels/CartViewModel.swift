//
//  CartViewModel.swift
//  Aktuel
//
//  Created by Hüseyin HÖBEK on 21.12.2022.
//

import Foundation
import UIKit
import CoreData

final class CartViewModel {
    
    var titles = [String]()
    var prices = [Double]()
    var images = [Data]()
    var productList: [NSManagedObject] = []
    
    
    
    
    func fetchObjects() {
        
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        let context = appDelegate.persistentContainer.viewContext
        let fetchRequest = NSFetchRequest<NSManagedObject>(entityName: "Cart")
        do {
            let result = try context.fetch(fetchRequest)
            self.productList = result
        } catch {
            print("Error fetching data: \(error.localizedDescription)")
        }
        for product in productList {
            if let title = product.value(forKey: "title") as? String {
                print(title)
            }
            if let price = product.value(forKey: "price") as? Double {
                print(price)
            }
            
        }
        
    }
    
    
}
struct CartObject: Codable {
    let image: Data?
    let title: String
    let price: Double
}

////
////  CoreData.swift
////  Aktuel
////
////  Created by Hüseyin HÖBEK on 21.12.2022.
////
//
//import Foundation
//import UIKit
//import CoreData
//
//
//extension MainViewController {
//
//    func createItem(listItem: String) {
//        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else { return }
//        let managedContext = appDelegate.persistentContainer.viewContext
//        let entity = NSEntityDescription.entity(forEntityName: "title", in: managedContext)
//        let cart = NSManagedObject(entity: entity!, insertInto: managedContext)
//        cart.setValue(listItem, forKey: "title")
//
//        do {
//            try managedContext.save()
//            print("işlem başarılı")
//        } catch let error {
//            print("Ürün Sepete Eklenemedi")
//        }
//    }
//
//    func coreData() {
//        
//
//
//    }
//    func addCoreData() {
//
//    }
//
//}

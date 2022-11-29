//
//  MainViewModel.swift
//  Aktuel
//  Created by Turan Çabuk on 29.11.2022.

import Foundation

struct productModel {
    let productDescription: String?
    let madein: String?
    let brand: String?
    let id: Int?
    let price: String?
    let createdAt: String
    let title: String?
    let category: String
    let imageMini: String
    let imageThumbnail: String?
    let imageOriginal: String?
    
    
    init(data: Product) {
        self.productDescription = data.productDescription
        self.madein = data.madein
        self.brand = data.brand
        self.id = data.id
        self.price = data.price?.originalStr
        self.createdAt = data.createdAt ?? ""
        self.title = data.title
        self.category = data.categoryBreadcrumb ?? ""
        self.imageMini = data.imageTypes?.mini ?? ""
        self.imageThumbnail = data.imageTypes?.thumbnail ?? ""
        self.imageOriginal = data.imageTypes?.original ?? ""
    
    }
}

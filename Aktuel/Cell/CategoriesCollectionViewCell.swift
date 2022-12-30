//
//  CategoriesCollectionViewCell.swift
//  Aktuel
//
//  Created by Hüseyin HÖBEK on 5.12.2022.
//

import UIKit

class CategoriesCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var categoryLabel: UILabel!
    
    @IBOutlet weak var categoryImage: UIImageView!
    
    var viewModel: MainViewModel?
    
    
    
    func configCategoriCells(model: String) {
        categoryLabel.text = model
        //  "Temizlik", "Yemeklik Malzemeler", "Ekmek & Pastane", "Süt & Süt Ürünleri", "İçecek", "Kağıt Ürünleri", "Kişisel Bakım & Kozmetik", "", "Elektronik", "Kahvaltılık", "Atıştırmalık", "Anne - Bebek & Çocuk", "Ev & Yaşam", "Giyim & Ayakkabı & Aksesuar"
        
        if categoryLabel.text == "Temizlik" {
            categoryImage.image = UIImage(named: "Temizlik")
        } else if categoryLabel.text == "Yemeklik Malzemeler" {
            categoryImage.image = UIImage(named: "Yemeklik Malzemeler")
        } else if categoryLabel.text == "Ekmek & Pastane" {
            categoryImage.image = UIImage(named: "Ekmek & Pastane")
        } else if categoryLabel.text == "Süt & Süt Ürünleri" {
            categoryImage.image = UIImage(named: "Süt & Süt Ürünleri")
        } else if categoryLabel.text == "Kağıt Ürünleri" {
            categoryImage.image = UIImage(named: "Kağıt Ürünleri")
        } else if categoryLabel.text == "Kişisel Bakım & Kozmetik" {
            categoryImage.image = UIImage(named: "Kişisel Bakım & Kozmetik")
        } else if categoryLabel.text == "Elektronik" {
            categoryImage.image = UIImage(named: "Elektronik")
        } else if categoryLabel.text == "Kahvaltılık" {
            categoryImage.image = UIImage(named: "Kahvaltılık")
        } else if categoryLabel.text == "Atıştırmalık" {
            categoryImage.image = UIImage(named: "Atıştırmalık")
        } else if categoryLabel.text == "Anne - Bebek & Çocuk" {
            categoryImage.image = UIImage(named: "Anne - Bebek & Çocuk")
        } else if categoryLabel.text == "Ev & Yaşam" {
            categoryImage.image = UIImage(named: "Ev & Yaşam")
        } else if categoryLabel.text == "Giyim & Ayakkabı & Aksesuar" {
            categoryImage.image = UIImage(named: "Giyim & Ayakkabı & Aksesuar")
        } else if categoryLabel.text == "İçecek" {
            categoryImage.image = UIImage(named: "İçecek")
        } else if categoryLabel.text == "" {
            categoryImage.image = UIImage(named: "Ekran Resmi 2022-12-02 22.59.12")
        }
    }
}

//
//  CategoryCell.swift
//  Aktuel
//
//  Created by Hüseyin HÖBEK on 30.12.2022.
//

import Foundation
import UIKit

class CategoryCell: UITableViewCell {
    
    
    @IBOutlet weak var images: UIImageView!
    @IBOutlet weak var priceLabel: UILabel!
    @IBOutlet weak var titleLabel: UILabel!
    
    
    func confingCategory(model: Product) {
        titleLabel.text = "model.title"
        
        
    }
    
    
    @IBAction func addToCartButton(_ sender: Any) {
    }
    
}

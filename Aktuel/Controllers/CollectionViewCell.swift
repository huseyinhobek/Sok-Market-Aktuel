//
//  CollectionViewCell.swift
//  Aktuel
//
//  Created by Hüseyin HÖBEK on 3.12.2022.
//

import UIKit
import Kingfisher

class MarketCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var images: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var priceLabel: UILabel!
    var viewModel: MainViewModel?

    func configCCells(model: Product) {
        self.titleLabel.text = model.title
        self.priceLabel.text = "\(model.price.original ?? 0)"
        //self.productCategory.text = model.category_breadcrumb
       // self.productImageView.image = model.imageTypes?.original
       // let url = URL(string: model.images?.description ?? "")
        let baseUrl = "https://cdnd-tr.ceptesok.com//product//100x100//"
        let url = URL(string: "\(baseUrl)\(model.images?.first?.url ?? "")")
        images.kf.setImage(with: url)
        
       
    }
    
    
}



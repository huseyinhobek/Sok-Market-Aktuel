////
////  ProductListCellViewController.swift
////  Aktuel
////
////  Created by Hüseyin HÖBEK on 29.11.2022.
////
//
//import UIKit
//import Kingfisher
//
//class ProductListCellViewController: UITableViewCell {
//
//    @IBOutlet weak var productImageView: UIImageView!
//    @IBOutlet weak var productTitle: UILabel!
//    @IBOutlet weak var productPrice: UILabel!
//    @IBOutlet weak var productCategory: UILabel!
//    
//    
//    func configCells(model: Product) {
//        self.productTitle.text = model.title
//        self.productPrice.text = "\(model.price.original ?? 0)"
//        self.productCategory.text = model.category_breadcrumb
//       // self.productImageView.image = model.imageTypes?.original
//       // let url = URL(string: model.images?.description ?? "")
//        let baseUrl = "https://cdnd-tr.ceptesok.com//product//100x100//"
//        let url = URL(string: "\(baseUrl)\(model.images?.first?.url ?? "")")
//        productImageView.kf.setImage(with: url)
//    }
//   
//        //productPrice.text = article.price
//        //newSource.textColor = .link
//       // newsImageView.image = UIImage("LOGO")
//        
//        //let url = URL(string: article.urlToImage ?? "")
//        //newsImageView.kf.setImage(with: url)
//        
//        //newSource.text = model.articleDescription
//        //  newsImageView.image = UIImage!
//    
//    
//}

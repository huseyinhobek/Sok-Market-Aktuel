//
//  DetailsViewController.swift
//  Aktuel
//
//  Created by Hüseyin HÖBEK on 4.12.2022.
//

import UIKit
import Kingfisher

class DetailsViewController: UIViewController {

    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var priceLabel: UILabel!
    @IBOutlet weak var categoryLabel: UILabel!
    @IBOutlet weak var titleLabel: UILabel!
    
    var selectedItem: Product!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        titleLabel.text = selectedItem.title
        priceLabel.text = "\(selectedItem.price.original as! Double)"
        categoryLabel.text = selectedItem.category_breadcrumb
        

        let baseUrl = "https://cdnd-tr.ceptesok.com//product//1000x1000//"
        let url = URL(string: "\(baseUrl)\(selectedItem.images?.first?.url ?? "")")
        imageView.kf.setImage(with: url)
        print(url)
    }
    

   

}

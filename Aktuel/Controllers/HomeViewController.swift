//
//  HomeViewController.swift
//  Aktuel
//
//  Created by Hüseyin HÖBEK on 4.12.2022.
//

import UIKit

class HomeViewController: UIViewController {

    @IBOutlet weak var itemsButton: UIButton!
    
    @IBOutlet weak var wesiteButton: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
//    func itemsButtonClicked() {
//        let itemController = DetailsViewController()
//        navigationController?.pushViewController(itemController, animated: true)
    //        performSegue(withIdentifier: "detailsVC", sender: nil)
//
//
//    }
    
    
    @IBAction func websiteButtonClicked(_ sender: Any) {
        
        let url = URL(string: "https://www.sokmarket.com.tr/")!
        UIApplication.shared.open(url, options: [:], completionHandler: nil)

      

        
    }

    

}

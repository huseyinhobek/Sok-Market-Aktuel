//
//  CategoryViewController.swift
//  Aktuel
//
//  Created by Hüseyin HÖBEK on 30.12.2022.
//

import UIKit
import Foundation

class CategoryViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    var viewModel: MainViewModel?
    var productsInCategory = [Product]()
    var selectedCategory: String?

    @IBOutlet weak var tableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        tableView.delegate = self
        tableView.dataSource = self
        

        // Do any additional setup after loading the view.
    }
    
    
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel?.categories.count ?? 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "categoryCell", for: indexPath) as! CategoryCell
        let filteredProducts = viewModel?.productList.filter {
            if let categoryBreadcrumb = $0.categoryBreadcrumb {
                return categoryBreadcrumb.starts(with: selectedCategory ?? "")
            }
            return false
        }

        if let product = filteredProducts?[indexPath.row] {
            cell.confingCategory(model: product)
        }
        return cell

    }

    
    
    
}

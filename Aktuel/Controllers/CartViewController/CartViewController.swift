//
//  CartViewController.swift
//  Aktuel
//
//  Created by Hüseyin HÖBEK on 26.12.2022.
//

import UIKit
import CoreData

class CartViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var tableView: UITableView!
    
    
    var viewModel: CartViewModel?
    var selectedProduct: [NSManagedObject] = []
    
    
    let cartViewModel = CartViewModel()
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let tableView = self.tableView {
            tableView.delegate = self
            tableView.dataSource = self
        }
        
        let nib = UINib(nibName: "CartTableViewCell", bundle: nil)
        if let tableView = self.tableView {
            tableView.register(nib, forCellReuseIdentifier: "CartCell")
        }
        // Do any additional setup after loading the view.
        viewModel = CartViewModel()
        
        viewModel?.fetchObjects()
        
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel?.productList.count ?? 0
    }
    
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CartCell", for: indexPath) as! CartTableViewCell
        // hücrenin özelliklerini veritabanından çekilen verilerle doldur
        let model = (viewModel?.productList[indexPath.row])!
        cell.confingTableView(model: model)
        return cell
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        // Fetch the latest cart data from the database
        viewModel?.fetchObjects()
        // Reload the table view to display the updated data
        DispatchQueue.main.async {
            self.tableView?.reloadData()
        }
    }
    
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // veritabanındaki ürünü silebilmek için NSManagedObjectContext nesnesine ihtiyacınız var
            let appDelegate = UIApplication.shared.delegate as! AppDelegate
            let context = appDelegate.persistentContainer.viewContext
            // veritabanındaki ürünü silebilmek için veritabanındaki ürünün NSManagedObject nesnesine ihtiyacınız var
            let product = viewModel?.productList[indexPath.row]
            context.delete(product!)
            // veritabanını kaydedin ve tableView'ı güncelleyin
            do {
                try context.save()
                viewModel?.productList.remove(at: indexPath.row)
                tableView.deleteRows(at: [indexPath], with: .fade)
            } catch {
                print("error! \(error.localizedDescription)")
            }
        }
    }
}



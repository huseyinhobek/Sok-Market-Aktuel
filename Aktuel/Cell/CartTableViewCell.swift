//
//  CartTableViewCell.swift
//  Aktuel
//
//  Created by Hüseyin HÖBEK on 18.12.2022.
//

import UIKit
import Kingfisher
import CoreData

class CartTableViewCell: UITableViewCell {
    var number: Int = 1
    static let identifier = String(describing: CartTableViewCell.self)
    @IBOutlet weak var productImage: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var priceLabel: UILabel!
    @IBOutlet weak var quantityLabel: UILabel!
    var viewModel: MainViewModel?
    var cartViewModel: CartViewModel?
    var cartVC = CartViewController()
    
    
    
    func confingTableView(model: NSManagedObject) {
        
        if let imageData = model.value(forKey: "image") {
            self.productImage.image = UIImage(data: imageData as! Data)
            productImage.frame = CGRect(x: 0, y: 0, width: 80, height: 80)
        }
        self.titleLabel?.text = model.value(forKey: "title") as? String
        self.priceLabel.text = "\(model.value(forKey: "price") ?? "0") TL"
    }
    
    
    @IBAction func plusButton(_ sender: Any) {
        
        if let quantityText = quantityLabel.text, let quantity = Int(quantityText) {
            if quantity >= 0 {
                // Artırma işlemini yap
                quantityLabel.text = String(quantity + 1)
            }
            
        }
    }
    @IBAction func removeButton(_ sender: Any) {
        // Check if the quantity is nil or less than 1
        if let quantityText = quantityLabel.text, let quantity = Int(quantityText) {
            let newQuantity = quantity > 0 ? quantity - 1 : 0
            quantityLabel.text = String(newQuantity)
            
            // If the quantity is 0, show an alert to ask the user if they want to remove the product from the cart
            if newQuantity == 0 {
                let alert = UIAlertController(title: "Onay", message: "Ürün sepetinizden kaldırılsın mı?", preferredStyle: .alert)
                let yesAction = UIAlertAction(title: "Evet", style: .default) { (action) in
                    // Remove the product from the cart and update the table view
                    if let indexPath = self.cartVC.tableView.indexPath(for: self) {
                        // Get the NSManagedObjectContext
                        let appDelegate = UIApplication.shared.delegate as! AppDelegate
                        let context = appDelegate.persistentContainer.viewContext
                        // Get the NSManagedObject for the product
                        let product = self.viewModel?.productList[indexPath.row] as? NSManagedObject
                        context.delete(product!)
                        // Save the database and update the table view
                        do {
                            try context.save()
                            self.viewModel?.productList.remove(at: indexPath.row)
                            self.cartVC.tableView.deleteRows(at: [indexPath], with: .fade)
                        } catch {
                            print("error! \(error.localizedDescription)")
                        }
                    }
                }
                let noAction = UIAlertAction(title: "Hayır", style: .cancel, handler: nil)
                alert.addAction(yesAction)
                alert.addAction(noAction)
                DispatchQueue.main.async {
                    self.cartVC.present(alert, animated: true, completion: nil)
                }
                
            }
        } else {
            quantityLabel.text = "0"
        }
    }
    
}





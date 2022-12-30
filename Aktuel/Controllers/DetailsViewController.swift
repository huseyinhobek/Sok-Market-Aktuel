//
//  DetailsViewController.swift
//  Aktuel
//
//  Created by Hüseyin HÖBEK on 4.12.2022.
//

import UIKit
import Kingfisher
import CoreData

class ProductDetailViewModel {
    var selectedItem: Product!
    
    init(selectedProduct: Product) {
        self.selectedItem = selectedProduct
    }
}

class DetailsViewController: UIViewController{
    
    var viewModel: ProductDetailViewModel?
    
    
    var managedObjectContext: NSManagedObjectContext!
    var cartVC = CartViewController()
    
    //appDelegate.persistentContainer.viewContext
    
    
    @IBOutlet weak var titleLabel: UILabel!
    
    @IBOutlet weak var priceLabel: UILabel!
    @IBOutlet weak var desText: UITextView!
    @IBOutlet weak var categoryLabel: UILabel!
    @IBOutlet weak var createdAtLabel: UILabel!
    @IBOutlet weak var imageView: UIImageView!
    
    
    var selectedItem: Product!
    var cart: [Product] = []
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        titleLabel.text = viewModel?.selectedItem.title
        priceLabel.text = "\(viewModel?.selectedItem.price?.original ?? 0) TL"
        categoryLabel.text = viewModel?.selectedItem.categoryBreadcrumb
        createdAtLabel.text = viewModel?.selectedItem.createdAt
        desText.text = viewModel?.selectedItem.productDescription
        
        let baseUrl = "https://cdnd-tr.ceptesok.com//product//1000x1000//"
        let url = URL(string: "\(baseUrl)\(viewModel?.selectedItem.images?.first?.url ?? "")")
        imageView.kf.setImage(with: url)
    }
    
    @IBAction func cartButtonClicked(_ sender: Any) {
        
        // veritabanından mevcut verileri çek
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        let context = appDelegate.persistentContainer.viewContext
        let fetchRequest = NSFetchRequest<NSManagedObject>(entityName: "Cart")
        do {
            let result = try context.fetch(fetchRequest)
            // mevcut veriler arasında ürünün zaten mevcut olup olmadığını kontrol et
            let title = titleLabel.text
            
            let price = Double(priceLabel.text ?? "0")
            let data = imageView.image?.jpegData(compressionQuality: 0.5)
            let isExisting = result.contains(where: {
                $0.value(forKey: "title") as? String == title &&
                $0.value(forKey: "price") as? Double == price &&
                $0.value(forKey: "image") as? Data == data
            })
            if isExisting {
                let alert = UIAlertController(title: "Uyarı", message: "Bu ürün sepetinizde mevcut.", preferredStyle: .alert)
                let okAction = UIAlertAction(title: "Tamam", style: .default, handler: nil)
                alert.addAction(okAction)
                self.present(alert, animated: true, completion: nil)
            }
            if !isExisting {
                let alert = UIAlertController(title: "Onay", message: "Ürünü sepete eklensin mi?", preferredStyle: .alert)
                let yesAction = UIAlertAction(title: "Evet", style: .default) { (action) in
                    // ürünü veritabanına ekle
                    let saveData = NSEntityDescription.insertNewObject(forEntityName: "Cart", into: context)
                    saveData.setValue(title, forKey: "title")
                    saveData.setValue(data, forKey: "image")
                    saveData.setValue(price, forKey: "price")
                    do {
                        try context.save()
                        print("success!")
                    } catch {
                        print("error! \(error.localizedDescription)")
                    }
                    self.cartVC.tableView?.reloadData()
                }
                let noAction = UIAlertAction(title: "Hayır", style: .cancel, handler: nil)
                alert.addAction(yesAction)
                alert.addAction(noAction)
                self.present(alert, animated: true, completion: nil)
            } else {
                print("ürün zaten mevcut")
            }
        } catch {
            print("error! \(error.localizedDescription)")
        }
        cartVC.tableView?.reloadData()
    }
    
}

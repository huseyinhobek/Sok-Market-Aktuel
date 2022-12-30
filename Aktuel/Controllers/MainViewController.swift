//
//  MainViewController.swift
//  Aktuel
//
//  Created by Hüseyin HÖBEK on 28.11.2022.

import UIKit

class MainViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource {
    
    
    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var categoryCollectionView: UICollectionView!
    
    var viewModel: MainViewModel?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        categoryCollectionView?.delegate = self
        categoryCollectionView?.dataSource = self
        collectionView?.delegate = self
        collectionView?.dataSource = self
        collectionView?.collectionViewLayout = UICollectionViewFlowLayout()
        categoryCollectionView.collectionViewLayout = UICollectionViewFlowLayout()
        viewModel = MainViewModel()
        
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        categoryCollectionView.collectionViewLayout = layout
        
        guard let viewModel = viewModel else { return }
        viewModel.getProducts(completion: {result in
            DispatchQueue.main.async {
                self.collectionView?.reloadData()
                self.categoryCollectionView?.reloadData()
                
            }
        })
        
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        if collectionView == categoryCollectionView {
            categoryCollectionView.backgroundColor = .orange
            
            return viewModel?.self.categories.count ?? 10
        } else {
            
            return viewModel?.productList.count ?? 5
            
        }
        
    }
    
    internal func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        if (collectionView == categoryCollectionView) {
            
            let cell2 = categoryCollectionView.dequeueReusableCell(withReuseIdentifier: "categoryCell", for: indexPath) as! CategoriesCollectionViewCell
            let items = (viewModel?.categories[indexPath.row])!
            cell2.configCategoriCells(model: items)
            return cell2
        } else {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "MarketCollectionViewCell", for: indexPath) as! MarketCollectionViewCell
            let article = viewModel?.productList[indexPath.row]
            cell.configCCells(model: article!)
            return cell
            
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if collectionView == categoryCollectionView {
            let selectedCategory = viewModel?.categories[indexPath.row]
            // Burada, selectedCategory değişkenine göre CategoryViewController sayfasına geçiş yapabilirsiniz.
            let storyboard = UIStoryboard(name: "Main", bundle: nil)
            let vc = storyboard.instantiateViewController(withIdentifier: "CategoryViewController") as! CategoryViewController
            vc.selectedCategory = selectedCategory
            self.navigationController?.pushViewController(vc, animated: true)
        } else {
            let chosenItem = viewModel?.productList[indexPath.row]
            let storyboard = UIStoryboard(name: "Main", bundle: nil)
            let vc = storyboard.instantiateViewController(withIdentifier: "detailsVC") as! DetailsViewController
            vc.viewModel = ProductDetailViewModel(selectedProduct: chosenItem!)
            self.navigationController?.pushViewController(vc, animated: true)
        }
    }

    
}

extension MainViewController: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        if collectionView == categoryCollectionView {
            
            return CGSize(width: 150, height: 140)
        } else {
            return CGSize(width: 180, height: 200)
        }
    }
    
}








//
//  MainViewController.swift
//  Aktuel
//
//  Created by Hüseyin HÖBEK on 28.11.2022.

import UIKit

class MainViewController: UIViewController {
    
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    
    
    var viewModel: MainViewModel?
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.title = "Aktüel Ürünler"
        
        collectionView?.delegate = self
        collectionView?.dataSource = self
        collectionView?.collectionViewLayout = UICollectionViewFlowLayout()
        viewModel = MainViewModel()
        guard let viewModel = viewModel else {return}
        viewModel.getProducts(completion: {result in
            DispatchQueue.main.async {
                self.collectionView?.reloadData()
            }
        })
        
    }
    
}

extension MainViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return viewModel?.productList.count ?? 5
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "MarketCollectionViewCell", for: indexPath) as! MarketCollectionViewCell
        let article = viewModel?.productList[indexPath.row]
        cell.configCCells(model: article!)
        return cell
        
        
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        viewModel?.productList[indexPath.row]
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let dest = segue.destination as? DetailsViewController, let index = collectionView.indexPathsForSelectedItems?.first {
            dest.selectedItem = viewModel?.productList[index.row]
        }
        
            
    }
    
    
//    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        return viewModel?.productList.count ?? 5
//    }
//
//    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//        let cell: ProductListCellViewController = (tableView.dequeueReusableCell(withIdentifier: "Cell") as? ProductListCellViewController)!
//        let article = viewModel?.productList[indexPath.row]
//        cell.configCells(model: article!)
//        return cell
//    }
}


extension MainViewController: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 100, height: 200)
    }
    
    
}





//
//  ViewController.swift
//  Aktuel
//
//  Created by Hüseyin HÖBEK on 26.12.2022.
//

import UIKit
class TabBarViewController: UITabBarController {
    
    var tabBarItems:  [UITabBarItem] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureTabBarItems()
        adjustBarItems(tabBarItems)
    }
    
    func configureTabBarItems() {
        
        
        let storyboard = UIStoryboard(name: "Main", bundle: Bundle.main)
        let mainViewController = storyboard.instantiateViewController(withIdentifier: "MainViewController" ) as! MainViewController
        //let mainViewController = MainViewController()
        let item1 = UITabBarItem(title: "", image: UIImage(systemName: "house"), tag: 0)
        item1.titlePositionAdjustment = UIOffset(horizontal: 0, vertical: 50)
        
        
        
        let cartStoryboard = UIStoryboard(name: "Cart", bundle: Bundle.main)
        let cartViewController = cartStoryboard.instantiateViewController(withIdentifier: "CartViewController" ) as! CartViewController
        
        
        //let basketViewController = BasketViewController()
        let item2 = UITabBarItem(title: "", image: UIImage(systemName: "cart"), tag: 1)
        item2.titlePositionAdjustment = UIOffset(horizontal: 0, vertical: 50)
        
        mainViewController.tabBarItem = item1
        cartViewController.tabBarItem = item2
        
        self.viewControllers = [mainViewController, cartViewController].map { UINavigationController(rootViewController: $0)}
        
    }
    func adjustBarItems (_ items : [UITabBarItem] )  {
        items.forEach { (item) in
            item.imageInsets = UIEdgeInsets(top: 6, left: 0, bottom: -6, right: 0)
            item.title = nil
            item.titlePositionAdjustment = UIOffset(horizontal: 0, vertical: 50)
        }
    }
}


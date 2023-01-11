//
//  TabBarController.swift
//  UISegmentControll
//
//  Created by Mikhail Chuparnov on 10.01.2023.
//

import UIKit

final class TabBarController: UITabBarController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor =  .systemGray6
        
        let vcArray = [
        setupTabBar(viewController: ItemsViewController(), title: "items", image: "bolt"),
        setupTabBar(viewController: FavoriteViewController(), title: "favorites", image: "bolt.heart"),
        setupTabBar(viewController: CartViewController(), title: "cart", image: "cart")
        ]
        self.viewControllers = vcArray
    }

    
    private func setupTabBar(viewController: UIViewController, title: String, image: String) -> UIViewController {
        
        let vc = UINavigationController(rootViewController: viewController)
        vc.tabBarItem.title = title
        vc.tabBarItem.image = UIImage(systemName: image)
        return vc
    }

}

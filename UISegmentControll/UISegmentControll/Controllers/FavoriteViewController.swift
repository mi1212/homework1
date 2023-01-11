//
//  FavoriteViewController.swift
//  UISegmentControll
//
//  Created by Mikhail Chuparnov on 10.01.2023.
//

import UIKit

class FavoriteViewController: UIViewController {

    let item = ItemView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupLayout()
    }
    
    private func setupLayout() {
        self.view.addSubview(item)
        
        let inset: CGFloat = 16
        
        NSLayoutConstraint.activate([
            item.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor, constant: inset),
            item.leadingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.leadingAnchor, constant: inset),
            item.trailingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.trailingAnchor, constant: -inset),
            item.heightAnchor.constraint(equalToConstant: 100),
        ])
    }

}

//
//  ViewController.swift
//  UISegmentControll
//
//  Created by Mikhail Chuparnov on 10.01.2023.
//

import UIKit

class ItemsViewController: UIViewController {
    
    let itemsArray = ["футболки", "значки", "головные уборы"]
    
    let itemImageView = CommonUIImageView()
    
    private lazy var itemsSegmentControl: UISegmentedControl = {
        let segmentControll = UISegmentedControl(items: itemsArray)
        segmentControll.translatesAutoresizingMaskIntoConstraints = false
        segmentControll.isMomentary = true
        return segmentControll
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .white
        setupLayout()
        
        self.itemsSegmentControl.addTarget(self, action: #selector(selectValues), for: .valueChanged)
    }
    
    private func setupLayout() {
        self.view.addSubview(itemsSegmentControl)
        self.view.addSubview(itemImageView)
        
        NSLayoutConstraint.activate([
            itemsSegmentControl.centerXAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.centerXAnchor),
            itemsSegmentControl.bottomAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.bottomAnchor, constant: -16),
            itemsSegmentControl.heightAnchor.constraint(equalToConstant: 30),
            itemsSegmentControl.widthAnchor.constraint(equalToConstant: 250),
        ])
        
        NSLayoutConstraint.activate([
            itemImageView.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor, constant: 16),
            itemImageView.leftAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.leftAnchor, constant: 16),
            itemImageView.trailingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.trailingAnchor, constant: -16),
            itemImageView.heightAnchor.constraint(equalTo: itemImageView.widthAnchor)
        ])
    }
    
    @objc private func selectValues(target: UISegmentedControl) {
        if target == self.itemsSegmentControl {
            let segmentIndex = target.selectedSegmentIndex
            
            switch segmentIndex {
            case 0:
                itemImageView.image = UIImage(named: "tshirt")
            case 1:
                itemImageView.image = UIImage(named: "pin")
            case 2:
                itemImageView.image = UIImage(named: "headgear")
            default:
                return
            }
        }
    }
    
    
}


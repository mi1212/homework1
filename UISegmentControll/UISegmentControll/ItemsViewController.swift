//
//  ViewController.swift
//  UISegmentControll
//
//  Created by Mikhail Chuparnov on 10.01.2023.
//

import UIKit

class ItemsViewController: UIViewController {
    
    let itemsArray = ["one", "two", "three"]
    let colorsArray = [
        UIColor.systemGray,
        UIColor.systemCyan,
        UIColor.systemIndigo
    ]
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
    }
    
    private func setupLayout() {
        self.view.addSubview(itemsSegmentControl)
        
        self.itemsSegmentControl.addTarget(self, action: #selector(selectValues), for: .valueChanged)
        NSLayoutConstraint.activate([
            itemsSegmentControl.centerXAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.centerXAnchor),
            itemsSegmentControl.bottomAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.bottomAnchor, constant: -16),
            itemsSegmentControl.heightAnchor.constraint(equalToConstant: 30),
            itemsSegmentControl.widthAnchor.constraint(equalToConstant: 250),
        ])
    }
    
    @objc private func selectValues(target: UISegmentedControl) {
        if target == self.itemsSegmentControl {
            let segmentIndex = target.selectedSegmentIndex
            self.view.backgroundColor = colorsArray[segmentIndex]
        }
    }
    
    
}


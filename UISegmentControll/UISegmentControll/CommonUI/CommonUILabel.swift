//
//  CommonUILabel.swift
//  UISegmentControll
//
//  Created by Mikhail Chuparnov on 11.01.2023.
//

import UIKit

class CommonUILabel: UILabel {
    
    init() {
        super.init(frame: .zero)
        setupProperts()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupProperts() {
        self.numberOfLines = 0
        self.font = UIFont.systemFont(ofSize: 16, weight: .light)
        self.translatesAutoresizingMaskIntoConstraints = false
    }
}



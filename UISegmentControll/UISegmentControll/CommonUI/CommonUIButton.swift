//
//  CommonUIButton.swift
//  UISegmentControll
//
//  Created by Mikhail Chuparnov on 11.01.2023.
//

import UIKit

class CommonUIButton: UIButton {

    init() {
        super.init(frame: .zero)
        setupProperts()
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupProperts() {
        self.translatesAutoresizingMaskIntoConstraints = false
        self.backgroundColor = .systemTeal
        self.layer.cornerRadius = 16
        self.clipsToBounds = true
    }
}

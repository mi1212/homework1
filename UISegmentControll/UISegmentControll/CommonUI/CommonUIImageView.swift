//
//  CommonUIImageView.swift
//  UISegmentControll
//
//  Created by Mikhail Chuparnov on 11.01.2023.
//

import UIKit

class CommonUIImageView: UIImageView {
    
    init() {
        super.init(frame: .zero)
        setupProperts()
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupProperts() {
        self.backgroundColor = .systemGray6
        self.clipsToBounds = true
        self.contentMode = .scaleAspectFit
        self.translatesAutoresizingMaskIntoConstraints = false
    }
    
}

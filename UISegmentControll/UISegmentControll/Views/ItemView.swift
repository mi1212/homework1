//
//  ItemView.swift
//  UISegmentControll
//
//  Created by Mikhail Chuparnov on 11.01.2023.
//

import UIKit

class ItemView: UIView {

    let image = CommonUIImageView()
    
    let titleLabel = CommonUILabel()
    
    init() {
        super.init(frame: .zero)
        setupLayout()
        setupProperts()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupLayout() {
        self.addSubview(image)
        self.addSubview(titleLabel)
        
        let inset: CGFloat = 8
        
        NSLayoutConstraint.activate([
            image.topAnchor.constraint(equalTo: self.topAnchor, constant: inset),
            image.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: inset),
            image.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -inset),
            image.widthAnchor.constraint(equalTo: image.heightAnchor)
        ])
        
        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: self.topAnchor, constant: inset),
            titleLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -inset),
            titleLabel.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -inset),
            titleLabel.leadingAnchor.constraint(equalTo: image.trailingAnchor, constant: inset)
        ])
    }
    
    private func setupProperts() {
        self.layer.cornerRadius = 16
        self.clipsToBounds = true
        image.contentMode = .scaleAspectFill
        image.layer.cornerRadius = 16
        image.clipsToBounds = true
        titleLabel.text = "Значок"
        
        self.translatesAutoresizingMaskIntoConstraints = false
        self.backgroundColor = .white
        image.image = UIImage(named: "pin")
    }

}

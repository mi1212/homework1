//
//  CartViewController.swift
//  UISegmentControll
//
//  Created by Mikhail Chuparnov on 10.01.2023.
//

import UIKit

class CartViewController: UIViewController {

    let item = ItemView()
    
    let stackView: UIStackView = {
        let stack = UIStackView()
        stack.distribution = .fillEqually
        stack.axis = .vertical
        stack.translatesAutoresizingMaskIntoConstraints = false
        return stack
    }()
    
    let titleLabel = CommonUILabel()
    
    let priceLabel = CommonUILabel()
    
    let checkoutButton = CommonUIButton()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupLayout()
        setupProperts()
    }
    
    private func setupLayout() {
        self.view.addSubview(item)
        self.view.addSubview(stackView)
        self.view.addSubview(checkoutButton)
        
        stackView.addArrangedSubview(titleLabel)
        stackView.addArrangedSubview(priceLabel)
        
       
        
        let inset: CGFloat = 16
        
        NSLayoutConstraint.activate([
            item.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor, constant: inset),
            item.leadingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.leadingAnchor, constant: inset),
            item.trailingAnchor.constraint(equalTo: self.stackView.leadingAnchor, constant: -inset),
            item.heightAnchor.constraint(equalToConstant: 100),
        ])
        
        NSLayoutConstraint.activate([
            stackView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: -inset),
            stackView.topAnchor.constraint(equalTo: item.topAnchor, constant: inset),
            stackView.bottomAnchor.constraint(equalTo: item.bottomAnchor, constant: -inset),
            stackView.widthAnchor.constraint(equalTo: stackView.heightAnchor)
        ])
        
        NSLayoutConstraint.activate([
            checkoutButton.bottomAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.bottomAnchor, constant: -inset),
            checkoutButton.leadingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.leadingAnchor, constant: inset),
            checkoutButton.trailingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.trailingAnchor, constant: -inset),
            checkoutButton.heightAnchor.constraint(equalToConstant: 56)
        ])
    }

    private func setupProperts() {
        item.image.image = UIImage(named: "tshirt")
        item.titleLabel.text = "Футболка"
        priceLabel.text = "1450 руб"
        titleLabel.text = "Цена:"
        
        checkoutButton.setTitle("Купить", for: .normal)
        checkoutButton.setTitleColor(.black, for: .selected)
        checkoutButton.addTarget(self, action: #selector(tapButton), for: .touchUpInside)
    }
    
    @objc private func tapButton() {
        animationTapButton(checkoutButton)
    }
    
    func animationTapButton(_ button: UIButton){
        
        let time = 0.06
        
        let scale = 0.95
        
        UIView.animate(withDuration: time, delay: 0) {
            button.transform = button.transform.scaledBy(x: scale, y: scale)
        } completion: { handler in
            UIView.animate(withDuration: time, delay: 0) {
                button.transform = button.transform.scaledBy(x: 1/scale, y: 1/scale)
            } completion: { handler in
                
            }
        }
    }
}

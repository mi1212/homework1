//
//  ViewController.swift
//  UISegmentControll
//
//  Created by Mikhail Chuparnov on 10.01.2023.
//

import UIKit

final class ItemsViewController: UIViewController {
    
    let itemsArray = ["футболки", "значки", "головные уборы"]
    
    var itemSegmentControllChosed = 0 {
        didSet {
            setupData(index: itemSegmentControllChosed)
        }
    }
    
    let picker: UIPickerView = {
        let picker = UIPickerView()
        
        return picker
    }()
    
    let descriptionsArray = [
        "Этот футбич - настоящая икона стиля для всех, кто не ищет уютных манежей зимой и прорезиненных стадионов летом. Для тех, кто несмотря на погоду за окном и расшатанную собянинскую плитку выходит на улицу раздавать десятки километров ежедневно. Если вы меня слышите, то вы и есть Runderground!",
        "Друзья, представляем вашему вниманию значки-отличия за приверженность к активному образу жизни.    Они не только выделят вас из толпы, но и помогут всегда узнать таких же братишек, мужских и женских, в бурном потоке городских масс. Это как ожог на тыльной стороне ладони в Бойцовском клубе или кроссовки «хока», мелькнувшие в переполненном утреннем метро, но только круче и в виде моднейшего значка. Добро пожаловать в клуб!",
        "Наши балаклавы сберегут ваши щёки от мороза и ветра, ваш хрупкий внутренний мир от лишнего внимания случайно встречных старых знакомых. Отлично подойдут сноубордистам, мотоциклистам, а так же любителям активного спорта и отдыха на свежем воздухе. Кто здесь усомнился в составе? Состав: 40% шерсть 60% акрил"
    ]
    
    let itemImageView = CommonUIImageView()
    
    let descriptionLabel = CommonUILabel()
    
    private lazy var itemsSegmentControl: UISegmentedControl = {
        let segmentControll = UISegmentedControl(items: itemsArray)
        segmentControll.translatesAutoresizingMaskIntoConstraints = false
        segmentControll.apportionsSegmentWidthsByContent = true
        segmentControll.selectedSegmentTintColor = .systemTeal
        return segmentControll
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupLayout()
        setupNavigationController()
        itemsSegmentControl.selectedSegmentIndex = itemSegmentControllChosed
        setupData(index: itemSegmentControllChosed)
        self.itemsSegmentControl.addTarget(self, action: #selector(selectValues), for: .valueChanged)
    }
    
    private func setupLayout() {
        self.view.addSubview(itemsSegmentControl)
        self.view.addSubview(itemImageView)
        self.view.addSubview(descriptionLabel)
        
        NSLayoutConstraint.activate([
            itemsSegmentControl.centerXAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.centerXAnchor),
            itemsSegmentControl.bottomAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.bottomAnchor, constant: -16),
            itemsSegmentControl.heightAnchor.constraint(equalToConstant: 30),
            itemsSegmentControl.widthAnchor.constraint(equalToConstant: 250),
        ])
        
        NSLayoutConstraint.activate([
            itemImageView.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor, constant: 16),
            itemImageView.leadingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.leadingAnchor, constant: 16),
            itemImageView.trailingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.trailingAnchor, constant: -16),
            itemImageView.heightAnchor.constraint(equalTo: itemImageView.widthAnchor)
        ])
        
        NSLayoutConstraint.activate([
            descriptionLabel.topAnchor.constraint(equalTo: itemImageView.bottomAnchor, constant: 16),
            descriptionLabel.leadingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.leadingAnchor, constant: 16),
            descriptionLabel.trailingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.trailingAnchor, constant: -16),
            descriptionLabel.bottomAnchor.constraint(equalTo: itemsSegmentControl.topAnchor, constant: -16)
        ])
    }
    
    private func setupNavigationController() {

        self.navigationController?.navigationBar.tintColor = .systemTeal
        
        let imageShareButton = UIImage(systemName: "square.and.arrow.up")
        
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(
            image: imageShareButton,
            style: .plain,
            target: self,
            action: #selector(tapShareButton)
        )
    }
    
    @objc private func tapShareButton() {
        let items = [descriptionsArray[itemSegmentControllChosed]]
        
        let ac = UIActivityViewController(activityItems: items, applicationActivities: nil)
        
        present(ac, animated: true)
    }
    
    @objc private func selectValues(target: UISegmentedControl) {
        if target == self.itemsSegmentControl {
            let segmentIndex = target.selectedSegmentIndex
            self.itemSegmentControllChosed = segmentIndex
        }
    }
    
    private func setupData(index: Int) {
        switch index {
        case 0:
            itemImageView.image = UIImage(named: "tshirt")
            descriptionLabel.text = descriptionsArray[index]
        case 1:
            itemImageView.image = UIImage(named: "pin")
            descriptionLabel.text = descriptionsArray[index]
        case 2:
            itemImageView.image = UIImage(named: "headgear")
            descriptionLabel.text = descriptionsArray[index]
        default:
            return
        }
    }
    
}


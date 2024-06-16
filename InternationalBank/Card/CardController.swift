//
//  File.swift
//  InternationalBank
//
//  Created by Ангел предохранитель on 16.05.2024.
//

import UIKit

final class CardController: BaseController {
    
    private let businessCell = CardCell(typeCard: .standart, nameCard: Resources.Strings.Card.business)
    private let virtualCell = CardCell(typeCard: .pro, nameCard: Resources.Strings.Card.virtual)
    private let personalCell = CardCell(typeCard: .metal, nameCard: Resources.Strings.Card.personal)
    private let business2Cell = CardCell(typeCard: .custom, nameCard: Resources.Strings.Card.business2)
    
    private let button = BaseButton(title: Resources.Strings.Card.addNew)
    
    private let stack: UIStackView = {
        let stack = UIStackView()
        stack.axis = .vertical
        stack.spacing = 35
        stack.alignment = .center
        stack.distribution = .fill
        return stack
    }()
    
    //MARK: viewDidload
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = Resources.Strings.Card.cards
        navigationController?.tabBarItem.title = nil
        
        button.addTarget(self, action: #selector(buttonTapped), for: .touchUpInside)
    }
    
    @objc private func buttonTapped() {
        
        let addCardController = AddCardController()
        
        addCardController.hidesBottomBarWhenPushed = true
        navigationController?.pushViewController(addCardController, animated: true)
    }
    
    
}

//MARK: ext
extension CardController {
    
    override func setupViews() {
        super.setupViews()
        
        view.addSubview(stack)
        
        [
            businessCell,
            virtualCell,
            personalCell,
            business2Cell
            
        ].forEach(stack.addArrangedSubview)
        
        view.addSubview(button)
    }
    
    override func setupConstraints() {
        super.setupConstraints()
        
        
        stack.translatesAutoresizingMaskIntoConstraints = false
        button.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            
            stack.topAnchor.constraint(equalTo: view.topAnchor, constant: 125),
            stack.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            stack.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            stack.heightAnchor.constraint(equalToConstant: 302),
            
            businessCell.leadingAnchor.constraint(equalTo: stack.leadingAnchor),
            businessCell.trailingAnchor.constraint(equalTo: stack.trailingAnchor),
            
            virtualCell.leadingAnchor.constraint(equalTo: stack.leadingAnchor),
            virtualCell.trailingAnchor.constraint(equalTo: stack.trailingAnchor),
            
            personalCell.leadingAnchor.constraint(equalTo: stack.leadingAnchor),
            personalCell.trailingAnchor.constraint(equalTo: stack.trailingAnchor),
            
            business2Cell.leadingAnchor.constraint(equalTo: stack.leadingAnchor),
            business2Cell.trailingAnchor.constraint(equalTo: stack.trailingAnchor),
            
            button.topAnchor.constraint(equalTo: stack.bottomAnchor, constant: 173),
            button.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 84),
            button.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -84),
            button.heightAnchor.constraint(equalToConstant: 60)
            
        ])

        
        
        
    }
    
    override func configureApperiens() {
        super.configureApperiens()
        
        businessCell.setGradient(type: .standart)
        virtualCell.setGradient(type: .pro)
        personalCell.setGradient(type: .metal)
        business2Cell.setGradient(type: .custom)
        
        button.applyGradient(colorArray: [Resources.Gradients.Standart.start, Resources.Gradients.Standart.end], cornerRadius: 10)

    }
}

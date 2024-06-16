//
//  CardCell.swift
//  InternationalBank
//
//  Created by Ангел предохранитель on 17.05.2024.
//

import UIKit

class CardCell: BaseVIew {
    
    private let nameCard: UILabel = {
        let lable = UILabel()
        lable.font = Resources.Fonts.helveticaRegulag(size: 16)
        lable.textColor = .black
        lable.textAlignment = .right
        return lable
    }()
    
    private let cardText: UILabel = {
        let lable = UILabel()
        lable.font = Resources.Fonts.helveticaRegulag(size: 16)
        lable.textColor = Resources.Colors.titleGray
        lable.text = "card"
        return lable
    }()
    
    private let textStack: UIStackView = {
        let stack = UIStackView()
        stack.axis = .vertical
        stack.alignment = .trailing
        stack.distribution = .fill
        stack.spacing = 5
        return stack
    }()
    
    private let cellStack: UIStackView = {
        let stack = UIStackView()
        stack.axis = .horizontal
        stack.distribution = .fillEqually
        stack.alignment = .center
        return stack
    }()
    
    private let card = MiniCard()
    
    //MARK: init
    init(typeCard: Cards, nameCard: String){
        super.init(frame: .zero)
        
        self.nameCard.text = nameCard
        self.card.setType(type: typeCard)
        
        setupViews()
        setupConstraints()
        configureApperiense()
    }
    
    required init?(coder: NSCoder) {
        super.init(frame: .zero)
        
        setupViews()
        setupConstraints()
        configureApperiense()
    }
    
    func setGradient(type: Cards) {
        layoutIfNeeded()
        switch type {
        case .standart:
            card.applyGradient(colorArray: [Resources.Gradients.Standart.start, Resources.Gradients.Standart.end], cornerRadius: 8)
            
        case .pro:
            card.applyGradient(colorArray: [Resources.Gradients.Pro.start, Resources.Gradients.Pro.end], cornerRadius: 8)
            
        case .metal:
            card.applyGradient(colorArray: [Resources.Gradients.Metal.start, Resources.Gradients.Metal.end], cornerRadius: 8)
            
        case .custom:
            card.applyGradient(colorArray: [Resources.Gradients.Custom.start, Resources.Gradients.Custom.end], cornerRadius: 8)
            
        }
    }
}

//MARK: ext
extension CardCell {
    
    override func setupViews() {
        super.setupViews()
        
        addSubview(textStack)
        addSubview(cellStack)
        textStack.addArrangedSubview(nameCard)
        textStack.addArrangedSubview(cardText)
        
        
        
        cellStack.addArrangedSubview(card)
        cellStack.addArrangedSubview(textStack)
    }
    
    override func setupConstraints() {
        super.setupConstraints()
        
        card.translatesAutoresizingMaskIntoConstraints = false
        textStack.translatesAutoresizingMaskIntoConstraints = false
        cellStack.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            
            cellStack.topAnchor.constraint(equalTo: topAnchor),
            cellStack.leadingAnchor.constraint(equalTo: leadingAnchor),
            cellStack.bottomAnchor.constraint(equalTo: bottomAnchor),
            cellStack.trailingAnchor.constraint(equalTo: trailingAnchor),
            
            card.trailingAnchor.constraint(equalTo: leadingAnchor, constant: 94),
            card.heightAnchor.constraint(equalToConstant: 50),

        ])
    }
    
    override func configureApperiense() {
        super.configureApperiense()
        
    }
}

//
//  CardView.swift
//  InternationalBank
//
//  Created by Ангел предохранитель on 26.05.2024.
//

import UIKit

final class CardView: BaseView {
    
    var cardType: Cards = .standart
    
    let cardName: UILabel = {
        let lable = UILabel()
        lable.font = Resources.Fonts.helveticaRegulag(size: 16)
        lable.textAlignment = .left
        lable.textColor = .white.withAlphaComponent(0.63)
        return lable
    }()
    
    let cardNumber: UILabel = {
        let lable = UILabel()
        lable.font = Resources.Fonts.helveticaRegulag(size: 26)
        lable.textAlignment = .left
        lable.textColor = .white
        return lable
    }()
    
    let nameSurname: UILabel = {
        let lable = UILabel()
        lable.text = Resources.Strings.Card.nameSurname.uppercased()
        lable.textColor = .white
        lable.textAlignment = .left
        lable.font = Resources.Fonts.helveticaRegulag(size: 12)
        return lable
    }()
    
    let cardDate: UILabel = {
        let lable = UILabel()
        lable.font = Resources.Fonts.helveticaRegulag(size: 12)
        lable.textAlignment = .left
        lable.textColor = .white
        lable.text = Resources.Strings.Card.cardDate
        return lable
    }()
    
    //MARK: - init
    init(cardType: Cards, cardName: String, cardNumber: String) {
        
        super.init(frame: .zero)
        
        self.cardType = cardType
        self.cardName.text = cardName
        self.cardNumber.text = cardNumber
        
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
    
    
}

//MARK: - ext
extension CardView {
    
    override func setupViews() {
        
        super.setupViews()
        
        addSubview(cardName)
        addSubview(cardNumber)
        addSubview(nameSurname)
        addSubview(cardDate)
        
    }
    
    override func setupConstraints() {
        
        super.setupConstraints()
        
        self.translatesAutoresizingMaskIntoConstraints = false
        cardName.translatesAutoresizingMaskIntoConstraints = false
        cardNumber.translatesAutoresizingMaskIntoConstraints = false
        nameSurname.translatesAutoresizingMaskIntoConstraints = false
        cardDate.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            
            self.heightAnchor.constraint(equalToConstant: 175),
            self.widthAnchor.constraint(equalToConstant: 319),
            
            cardName.topAnchor.constraint(equalTo: topAnchor, constant: 25),
            cardName.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 24),
            cardName.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -120),
            
            cardNumber.topAnchor.constraint(equalTo: cardName.bottomAnchor, constant: 10),
            cardNumber.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 24),
            
            nameSurname.topAnchor.constraint(equalTo: cardNumber.bottomAnchor, constant: 41),
            nameSurname.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -166),
            nameSurname.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -35),
            nameSurname.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 24),
            
            cardDate.topAnchor.constraint(equalTo: cardNumber.bottomAnchor, constant: 41),
            cardDate.leadingAnchor.constraint(equalTo: nameSurname.trailingAnchor, constant: 69),
            
        ])
        
    }
    
    override func configureApperiense() {
        
        super.configureApperiense()
        
        layoutIfNeeded()
        
        switch cardType {
            
        case .standart:
            
            self.applyGradient(
                colorArray: [Resources.Gradients.Standart.start,
                             Resources.Gradients.Standart.end],
                cornerRadius: 14)
            
        case .pro:
            
            self.applyGradient(
                colorArray: [Resources.Gradients.Pro.start,
                             Resources.Gradients.Pro.end],
                cornerRadius: 14)
            
        case .metal:
            
            self.applyGradient(
                colorArray: [Resources.Gradients.Metal.start,
                             Resources.Gradients.Metal.end],
                cornerRadius: 14)
            
        case .custom:
            
            self.applyGradient(
                colorArray: [Resources.Gradients.Custom.start,
                             Resources.Gradients.Custom.end],
                cornerRadius: 14)
            
        }
        
    }
    
}

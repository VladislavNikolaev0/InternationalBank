//
//  ChoseCardView.swift
//  InternationalBank
//
//  Created by Ангел предохранитель on 04.07.2024.
//

import UIKit

final class ChoseCardView: BaseView {
    
    private var cardType: Cards = .standart
    
    private var isCardDetailsVisible = false
    
    private var originalCardNumber: String?
    private var originalCardCvvValue: String?
    
    private let cardName: UILabel = {
        let lable = UILabel()
        lable.font = Resources.Fonts.helveticaBold(size: 14)
        lable.textAlignment = .left
        lable.textColor = .white.withAlphaComponent(0.63)
        return lable
    }()
    
    private let cardDate: UILabel = {
        let lable = UILabel()
        lable.font = Resources.Fonts.helveticaBold(size: 16)
        lable.textAlignment = .left
        lable.textColor = .white
        return lable
    }()
    
    private let cardCvv: UILabel = {
        let lable = UILabel()
        lable.font = Resources.Fonts.helveticaBold(size: 16)
        lable.textAlignment = .left
        lable.textColor = .white
        lable.text = Resources.Strings.Card.cvv.uppercased()
        return lable
    }()
    
    private let cardCvvValue: UILabel = {
        let lable = UILabel()
        lable.font = Resources.Fonts.helveticaBold(size: 16)
        lable.textAlignment = .right
        lable.textColor = .white
        return lable
    }()
    
    private let cardNumberFirstChunk: UILabel = {
        let lable = UILabel()
        lable.font = Resources.Fonts.helveticaBold(size: 26)
        lable.textAlignment = .left
        lable.textColor = .white
        return lable
    }()
    
    private let cardNumberSecondChunk: UILabel = {
        let lable = UILabel()
        lable.font = Resources.Fonts.helveticaBold(size: 26)
        lable.textAlignment = .left
        lable.textColor = .white
        return lable
    }()
    
    private let eyeView = EyeView(open: true)
    
    //MARK: - init
    init(cardType: Cards, name: String, number: String, date: String, cvv: String) {
        
        super.init(frame: .zero)
        
        self.cardType = cardType
        self.originalCardNumber = String(number.dropFirst(4))
        self.originalCardCvvValue = cvv
        
        cardName.text = name
        cardDate.text = date
        cardCvvValue.text = cvv
        
        setupViews()
        setupConstraints()
        configureApperiense()
        
        hideCardDetails()
        cardNumberFirstChunk.text = getFirstCardNumberChunk(number)
        
    }
    
    required init?(coder: NSCoder) {
        
        super.init(coder: coder)
        
        setupViews()
        setupConstraints()
        configureApperiense()
        
        hideCardDetails()
        
    }
    
    //MARK: - layoutSubviews
    override func layoutSubviews() {
        
        super.layoutSubviews()
        
        eyeView.addPupilToSuperview()
        
        let eyeTap = UITapGestureRecognizer(target: self, action: #selector(eyeballTapped))
        eyeView.addGestureRecognizer(eyeTap)
        
    }
    
    @objc private func eyeballTapped() {
        
        isCardDetailsVisible.toggle()
        eyeView.toggleEye()
        
        if isCardDetailsVisible {
            
            showCardDetails()
            
        } else {
            
            hideCardDetails()
            
        }
        
    }
    
    private func showCardDetails() {
        
        UIView.transition(with: cardNumberSecondChunk, duration: 0.5, options: .transitionFlipFromTop, animations: {
            
            self.cardNumberSecondChunk.text = self.originalCardNumber
            self.cardNumberSecondChunk.font = Resources.Fonts.helveticaBold(size: 26)
            
        }, completion: nil)
        
        UIView.transition(with: cardCvvValue, duration: 0.5, options: .transitionFlipFromTop, animations: {
            
            self.cardCvvValue.text = self.originalCardCvvValue
            self.cardCvvValue.font = Resources.Fonts.helveticaBold(size: 16)
            self.cardCvvValue.transform = .identity
            
        }, completion: nil)
        
    }
    
    private func hideCardDetails() {
        
        cardNumberSecondChunk.text = getSecondCardNumverChunk(self.originalCardNumber)
        
        let maskedCardNumber = cardNumberSecondChunk.text
        let maskedCardCvvValue = "***"
        
        UIView.transition(with: cardNumberSecondChunk, duration: 0.5, options: .transitionFlipFromTop, animations: {
            
            self.cardNumberSecondChunk.text = maskedCardNumber
            self.cardNumberSecondChunk.font = Resources.Fonts.helveticaBold(size: 36)
            
        }, completion: nil)
        
        UIView.transition(with: cardCvvValue, duration: 0.5, options: .transitionFlipFromTop, animations: {
            
            self.cardCvvValue.text = maskedCardCvvValue
            self.cardCvvValue.font = Resources.Fonts.helveticaBold(size: 22)
            self.cardCvvValue.transform = CGAffineTransform(translationX: 0, y: 5)
            
        }, completion: nil)
        
    }
    
    private func maskCardNumber(_ cardNumber: String?) -> String {
        
        guard let cardNumber = cardNumber else { return "**** **** **** ****" }
        
        let visibleDigits = String(cardNumber.prefix(4))
        let maskedDigits = cardNumber.map { $0 == " " ? " " : "*" }.joined()
        
        return visibleDigits + maskedDigits
        
    }
    
    private func getFirstCardNumberChunk(_ cardNumber: String?) -> String {
        
        guard let cardNumber = cardNumber else { return "****" }
        
        let firstChunk = String(cardNumber.prefix(4))
        
        return firstChunk
        
    }
    
    private func getSecondCardNumverChunk(_ cardNumber: String?) -> String {
        
        guard let cardNumber = cardNumber else { return "**** **** ****" }
        
        let secondChunk = cardNumber.map { $0 == " " ? " " : "*" }.joined()
        
        return secondChunk
        
    }
    
}

//MARK: - ext
extension ChoseCardView {
    
    override func setupViews() {
        
        super.setupViews()
        
        addSubview(cardName)
        addSubview(cardDate)
        addSubview(cardCvv)
        addSubview(cardCvvValue)
        addSubview(eyeView)
        addSubview(cardNumberFirstChunk)
        addSubview(cardNumberSecondChunk)

    }
    
    override func setupConstraints() {
        
        super.setupConstraints()
        
        cardName.translatesAutoresizingMaskIntoConstraints = false
        cardDate.translatesAutoresizingMaskIntoConstraints = false
        cardCvv.translatesAutoresizingMaskIntoConstraints = false
        cardCvvValue.translatesAutoresizingMaskIntoConstraints = false
        eyeView.translatesAutoresizingMaskIntoConstraints = false
        cardNumberFirstChunk.translatesAutoresizingMaskIntoConstraints = false
        cardNumberSecondChunk.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            
            self.heightAnchor.constraint(equalToConstant: 175),
            self.widthAnchor.constraint(equalToConstant: 319),
            
            cardName.topAnchor.constraint(equalTo: topAnchor, constant: 25),
            cardName.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 24),
            
            cardNumberFirstChunk.topAnchor.constraint(equalTo: cardName.bottomAnchor, constant: 10),
            cardNumberFirstChunk.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 24),
            
            cardNumberSecondChunk.topAnchor.constraint(equalTo: cardName.bottomAnchor, constant: 10),
            cardNumberSecondChunk.leadingAnchor.constraint(equalTo: cardNumberFirstChunk.trailingAnchor),
            
            cardDate.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -29),
            cardDate.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 24),
            
            cardCvv.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -29),
            cardCvv.leadingAnchor.constraint(equalTo: cardDate.trailingAnchor, constant: 48),
            cardCvvValue.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -29),
            cardCvvValue.leadingAnchor.constraint(equalTo: cardCvv.trailingAnchor, constant: 5),
            
            eyeView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -29),
            eyeView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -41),
            eyeView.widthAnchor.constraint(equalToConstant: 22),
            eyeView.heightAnchor.constraint(equalToConstant: 15),
            
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

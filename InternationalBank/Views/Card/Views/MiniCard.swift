//
//  MiniCard.swift
//  InternationalBank
//
//  Created by Ангел предохранитель on 17.05.2024.
//

import UIKit

enum Cards {
    
    case standart
    case pro
    case metal
    case custom
    
}

final class MiniCard: BaseView {
    
    private var type: Cards = .standart
    
    private let lable: UILabel = {
        let lable = UILabel()
        lable.text = Resources.Strings.Card.standartNumber
        lable.font = Resources.Fonts.helveticaRegulag(size: 14)
        lable.textColor = .white
        lable.textAlignment = .center
        return lable
    }()
    
    
    //MARK: - init
    init(type: Cards = .standart) {
        
        super.init(frame: .zero)
        
        self.type = type
        
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
    
    //MARK: - layoutSupBiews
    override func layoutSubviews() {
        
        super.layoutSubviews()
        
        setGradient(type: type)
        
    }
    
    func setType(type: Cards) {
        
        self.type = type
        
    }
    
    func setGradient(type: Cards) {
        
        layoutIfNeeded()
        
        guard self.bounds.height > 0 else { return }
        
        let gradientLayer = CAGradientLayer()
        
        gradientLayer.frame = self.bounds
        
        switch type {
            
        case .standart:
            
            self.applyGradient(
                colorArray: [Resources.Gradients.Standart.start,
                             Resources.Gradients.Standart.end],
                cornerRadius: 8)
            
        case .pro:
            
            self.applyGradient(
                colorArray: [Resources.Gradients.Pro.start,
                             Resources.Gradients.Pro.end],
                cornerRadius: 8)
            
        case .metal:
            
            self.applyGradient(
                colorArray: [Resources.Gradients.Metal.start,
                             Resources.Gradients.Metal.end],
                cornerRadius: 8)
            
        case .custom:
            
            self.applyGradient(
                colorArray: [Resources.Gradients.Custom.start,
                             Resources.Gradients.Custom.end],
                cornerRadius: 8)
            
        }
    }
}

//MARK: - ext
extension MiniCard {
    
    override func setupViews() {
        
        super.setupViews()

        addSubview(lable)
        
    }
    
    override func setupConstraints() {
        
        super.setupConstraints()
        
        lable.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            
            lable.centerYAnchor.constraint(equalTo: centerYAnchor),
            lable.centerXAnchor.constraint(equalTo: centerXAnchor),
            
            self.heightAnchor.constraint(equalToConstant: 50),
            self.widthAnchor.constraint(equalToConstant: 94),
            
        ])
        
    }
    
    override func configureApperiense() {
        
        super.configureApperiense()
        
    }
}

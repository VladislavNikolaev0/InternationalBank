//
//  BaseButtonVIew.swift
//  InternationalBank
//
//  Created by Ангел предохранитель on 20.05.2024.
//

import UIKit

class BaseButton: UIButton {
    
    private let title: UILabel = {
        let lable = UILabel()
        lable.font = Resources.Fonts.helveticaRegulag(size: 16)
        lable.textColor = .white
        lable.textAlignment = .center
        return lable
    }()
    
    //MARK: init
    init(title: String) {
        super.init(frame: .zero)
        
        self.title.text = title
        
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

//MARK: ext
extension BaseButton {
    
    func setupViews() {
    
        addSubview(title)
        
    }
    
    func setupConstraints() {
        
        title.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            title.centerXAnchor.constraint(equalTo: centerXAnchor),
            title.centerYAnchor.constraint(equalTo: centerYAnchor),
        ])
    }
    
    func configureApperiense() {
        
        makeSystem(self)
        
    }
}

//
//  BaseVIew.swift
//  InternationalBank
//
//  Created by Ангел предохранитель on 16.05.2024.
//

import UIKit

class BaseVIew: UIView {
    
    //MARK: init
    override init(frame: CGRect) {
        super .init(frame: frame)
        
        setupViews()
        setupConstraints()
        configureApperiense()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

//MARK: objc ext
@objc extension BaseVIew {
    
    func setupViews() {}
    
    func setupConstraints() {}
    
    func configureApperiense() {}
}


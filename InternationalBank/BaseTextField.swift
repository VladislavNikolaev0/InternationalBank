//
//  BaseTextField.swift
//  InternationalBank
//
//  Created by Ангел предохранитель on 26.05.2024.
//

import UIKit

public enum AlignmentText {
    case left
    case center
}

class BaseTextField: UITextField {
    
    var aligmentTextField: AlignmentText = .left
    
    //MARK: init
    init(placeholder: String, alignment: AlignmentText = .left) {
        super.init(frame: .zero)
        
        self.placeholder = placeholder
        self.aligmentTextField = alignment
        
        setupViews()
        setupConstraints()
        configureApperiens()
    }
    
    required init?(coder: NSCoder) {
        super.init(frame: .zero)
        
        setupViews()
        setupConstraints()
        configureApperiens()
    }
}

//MARK: ext
extension BaseTextField {
    
    func setupViews() {}
    
    func setupConstraints() {}
    
    func configureApperiens() {
        
        self.borderStyle = .roundedRect
        self.clearButtonMode = .never
        self.returnKeyType = .done
        self.textColor = Resources.Gradients.Standart.end
        self.backgroundColor = Resources.Colors.background
        self.font = Resources.Fonts.helveticaRegulag(size: 14)
        self.layer.cornerRadius = 10
        self.layer.borderColor = Resources.Colors.borderColor.cgColor
        self.layer.borderWidth = 3
        
        self.setLeftPadding(points: 26)
        
        switch aligmentTextField {
        case .left:
            self.textAlignment = .left
            attributedPlaceholder = NSAttributedString(string: placeholder ?? "",
                                                       attributes: [NSAttributedString.Key.foregroundColor: Resources.Gradients.Standart.end])
        case .center:
            self.textAlignment = .center
            
        }
        
    }
}

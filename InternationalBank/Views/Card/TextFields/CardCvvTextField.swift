//
//  CardCvvTextField.swift
//  InternationalBank
//
//  Created by Ангел предохранитель on 02.06.2024.
//

import UIKit

final class CardCvvTextField: BaseTextField, UITextFieldDelegate {
    
    //MARK: - init
    override init(placeholder: String, alignment: AlignmentText = .left) {
        
        super.init(placeholder: placeholder, alignment: alignment)
        
        configure()
        
    }
    
    required init?(coder: NSCoder) {
        
        super.init(coder: coder)
        
        configure()
        
    }
    
    
    //MARK: - Configure
    private func configure() {
        
        self.keyboardType = .numberPad
        self.delegate = self
        
    }
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        
        let currentText = textField.text ?? ""
        
        let newLength = currentText.count + string.count - range.length
        if newLength > 3 { return false }
        
        let allowedCharacters = CharacterSet(charactersIn: "0123456789")
        let characterSet = CharacterSet(charactersIn: string)
        
        return allowedCharacters.isSuperset(of: characterSet)
        
    }
}

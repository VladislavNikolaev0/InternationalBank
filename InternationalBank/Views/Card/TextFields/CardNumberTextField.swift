//
//  CardNumberTextField.swift
//  InternationalBank
//
//  Created by Ангел предохранитель on 30.05.2024.
//

import UIKit

class CardNumberTextField: BaseTextField, UITextFieldDelegate {
    
    
    //MARK: - init
    override init(placeholder: String, alignment: AlignmentText = .left) {
        
        super.init(placeholder: placeholder)
        
        configure()
        
    }
    
    required init?(coder: NSCoder) {
        
        super.init(coder: coder)
        
        configure()
        
    }
    
    //MARK: - configure
    private func configure() {
        
        self.keyboardType = .numberPad
        self.delegate = self
        self.addTarget(self, action: #selector(editingCanged), for: .editingChanged)
        
    }
    
    @objc private func editingCanged() {
        
        if let text = self.text {
            
            self.text = formatCardNumber(cardNumber: text)
            
        }
        
    }
    
    private func formatCardNumber(cardNumber: String) -> String {
        
        let digitsOnly = cardNumber.replacingOccurrences(of: "\\D",
                                                         with: "",
                                                         options: .regularExpression)
        
        let grouped = digitsOnly.chunked(size: 4).joined(separator: " ")
        
        return String(grouped.prefix(19))
        
    }
    
    func textField(_ textField: UITextField, range: NSRange, string: String) -> Bool {
        
        let currentText = textField.text ?? ""
        
        guard let stringRange = Range(range, in: currentText) else { return false }
        
        let updateText = currentText.replacingCharacters(in: stringRange, with: string)
        
        let digitsOnly = updateText.replacingOccurrences(of: "\\D",
                                                         with: "",
                                                         options: .regularExpression)
        
        return digitsOnly.count <= 16
        
    }
}


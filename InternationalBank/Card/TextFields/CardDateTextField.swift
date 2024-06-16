//
//  CardDateTextField.swift
//  InternationalBank
//
//  Created by Ангел предохранитель on 02.06.2024.
//

import UIKit

final class CardDateTextField: BaseTextField, UITextFieldDelegate {
    
    
    //MARK: init
    override init(placeholder: String, alignment: AlignmentText = .left) {
        super.init(placeholder: placeholder, alignment: alignment)
        
        configure()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        
        configure()
    }
    
    //MARK: Congigure
    private func configure() {
        
        self.keyboardType = .numberPad
        self.delegate = self
        
    }
    
    private func formatDate(textDate: String) -> String {
        
        let cleanedText = textDate.replacingOccurrences(of: "/", with: "")
        var formattedText = ""
        
        for (index, character) in cleanedText.enumerated() {
            
            if index == 2 { formattedText.append("/") }
            
            formattedText.append(character)
            
        }
        
        return formattedText
    }
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        
        let currentText = textField.text ?? ""
        
        let newLengh = currentText.count + string.count - range.length
        
        if newLengh > 5 { return false }
        
        let updatedText = (currentText as NSString).replacingCharacters(in: range, with: string)
        
        let allowedCharacters = CharacterSet(charactersIn: "0123456789/")
        let characterSet = CharacterSet(charactersIn: updatedText)
        
        if !allowedCharacters.isSuperset(of: characterSet) { return false }
        
        textField.text = formatDate(textDate: updatedText)
        
        return false
    }
}


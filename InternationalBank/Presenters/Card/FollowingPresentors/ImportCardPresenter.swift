//
//  ImportCardPresenter.swift
//  InternationalBank
//
//  Created by Ангел предохранитель on 30.06.2024.
//

import UIKit

protocol ImportCardPresenterProtocol: AnyObject {
    
    func buttonTapped(
        cardNameTextField: UITextField,
        cardNumberTextFeild: UITextField,
        cardDateTextField: UITextField,
        cardCVVTextField: UITextField )
    
    func validateTextField(_ textField: UITextField) -> Bool
    
    func validateCardNumber(_ cardNumber: String?) -> Bool
    
    func validateDate(_ date: String?) -> Bool
    
    func validateCardCVV(_ cvv: String?) -> Bool
    
    func showError(textField: UITextField)
    
    func shakeTextField(_ textField: UITextField)
    
    
}

final class ImportCardPresenter: ImportCardPresenterProtocol {
    
    weak var view: ImportCardViewProtocol!
    
    //MARK: - init
    init(view: ImportCardViewProtocol! ) {
        
        self.view = view
        
    }
    
    func buttonTapped(
        cardNameTextField: UITextField,
        cardNumberTextFeild cardNumberTextField: UITextField,
        cardDateTextField: UITextField,
        cardCVVTextField cardCvvTextField: UITextField ) {
            
            let cardNameValid = validateTextField(cardNameTextField)
            let cardNumberValid = validateCardNumber(cardNumberTextField.text)
            let cardDateValid = validateDate(cardDateTextField.text)
            let cardCvvValid = validateCardCVV(cardCvvTextField.text)
            
            if cardNameValid && cardNumberValid && cardDateValid && cardCvvValid {
                
                let addImportCardFinalController = ImportCardFinalController(roolUp: true)
                
                addImportCardFinalController.hidesBottomBarWhenPushed = true
                
                view.navigateToFinalContoller()
                
            } else {
                
                if !cardNameValid {
                    
                    showError(textField: cardNameTextField)
                    
                } else {
                    
                    cardNameTextField.layer.borderColor = Resources.Colors.borderColor.cgColor
                    
                }
                
                if !cardNumberValid {
                    
                    showError(textField: cardNumberTextField)
                    
                } else {
                    
                    cardNumberTextField.layer.borderColor = Resources.Colors.borderColor.cgColor
                    
                }
                
                if !cardDateValid {
                    
                    showError(textField: cardDateTextField)
                    
                } else {
                    
                    cardDateTextField.layer.borderColor = Resources.Colors.borderColor.cgColor
                    
                }
                
                if !cardCvvValid {
                    
                    showError(textField: cardCvvTextField)
                    
                } else {
                    
                    cardCvvTextField.layer.borderColor = Resources.Colors.borderColor.cgColor
                    
                }
                
            }
            
        }
    
    func validateTextField(_ textField: UITextField) -> Bool {
        
        guard let text = textField.text, !text.isEmpty else { return false }
        
        return true
        
    }
    
    func validateCardNumber(_ cardNumber: String?) -> Bool {
        
        guard let cardNumber = cardNumber else { return false }
        
        let digitsOnly = cardNumber.replacingOccurrences(of: "\\D", with: "", options: .regularExpression)
        
        return digitsOnly.count == 16
        
    }
    
    func validateDate(_ date: String?) -> Bool {
        
        guard let date = date else { return false }
        
        let dateRegex = "^(0[1-9]|1[0-2])/([0-9]{2})$"
        let datePredicate = NSPredicate(format: "SELF MATCHES %@", dateRegex)
        
        return datePredicate.evaluate(with: date)
        
    }
    
    func validateCardCVV(_ cvv: String?) -> Bool {
        
        guard let cvv = cvv else { return false }
        
        let cvvRegex = "^[0-9]{3,4}$"
        let cvvPredicate = NSPredicate(format: "SELF MATCHES %@", cvvRegex)
        
        return cvvPredicate.evaluate(with: cvv)
        
    }
    
    func showError(textField: UITextField) {
        
        textField.layer.borderColor = UIColor.red.cgColor
        textField.layer.borderWidth = 1.0
        
        shakeTextField(textField)
        
    }
    
    func shakeTextField(_ textField: UITextField) {
        
        let animation = CABasicAnimation(keyPath: "position")
        
        animation.duration = 0.05
        animation.repeatCount = 4
        animation.autoreverses = true
        animation.fromValue = NSValue(cgPoint: CGPoint(x: textField.center.x - 10, y: textField.center.y))
        animation.toValue = NSValue(cgPoint: CGPoint(x: textField.center.x + 10, y: textField.center.y))
        textField.layer.add(animation, forKey: "position")
        
    }
}

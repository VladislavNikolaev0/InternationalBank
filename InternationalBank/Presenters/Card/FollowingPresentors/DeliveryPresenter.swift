//
//  DeliveryPresenter.swift
//  InternationalBank
//
//  Created by Ангел предохранитель on 01.07.2024.
//

import UIKit

protocol DeliveryPresenterProtocol: AnyObject {
    
    func buttonTapped(countryTextField: UITextField,
                      addressTextField: UITextField,
                      codeTextField: UITextField,
                      cityTextField: UITextField)
    
    func validateTextField(_ textField: UITextField) -> Bool
    
    func showError(textField: UITextField)
    
    func shakeTextField(_ textField: UITextField)
}

final class DeliveryPresenter: DeliveryPresenterProtocol {
    
    weak var view: DeliveryViewProtocol!
    
    //MARK: - init
    init(view: DeliveryViewProtocol!) {
        
        self.view = view
        
    }
    
    func buttonTapped(countryTextField: UITextField,
                      addressTextField: UITextField,
                      codeTextField: UITextField,
                      cityTextField: UITextField) {
        
        let countryTextValide = validateTextField(countryTextField)
        let addressTextValide = validateTextField(addressTextField)
        let codeTextValide = validateTextField(codeTextField)
        let cityTextValide = validateTextField(cityTextField)
        
        if countryTextValide && addressTextValide && codeTextValide && cityTextValide {
            
            view.navigateToFinalController()
            
        } else {
            
            if !countryTextValide {
                
                showError(textField: countryTextField)
                
            } else {
                
                countryTextField.layer.borderColor = Resources.Colors.borderColor.cgColor
                
            }
            
            if !addressTextValide {
                
                showError(textField: addressTextField)
                
            } else {
                
                addressTextField.layer.borderColor = Resources.Colors.borderColor.cgColor
                
            }
            
            if !codeTextValide {
                
                showError(textField: codeTextField)
                
            } else {
                
                codeTextField.layer.borderColor = Resources.Colors.borderColor.cgColor
                
            }
            
            if !cityTextValide {
                
                showError(textField: cityTextField)
                
            } else {
                
                cityTextField.layer.borderColor = Resources.Colors.borderColor.cgColor
                
            }
            
        }
        
    }
    
    func validateTextField(_ textField: UITextField) -> Bool {
        
        guard let text = textField.text, !text.isEmpty else { return false }
        
        return true
        
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

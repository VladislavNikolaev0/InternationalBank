//
//  DeliveryController.swift
//  InternationalBank
//
//  Created by Ангел предохранитель on 11.06.2024.
//

import UIKit

final class DeliveryController: BaseController {
    
    let countryTextField = BaseTextField(placeholder: Resources.Strings.Card.uS)
    
    let addressTextField = BaseTextField(placeholder: Resources.Strings.Card.addressExample)
    
    let codeTextField = BaseTextField(placeholder: Resources.Strings.Card.codeExample)
    
    let cityTextField = BaseTextField(placeholder: Resources.Strings.Card.cityExample)
    
    let countryLable: UILabel = {
        let lable = UILabel()
        lable.text = Resources.Strings.Card.country
        lable.font = Resources.Fonts.helveticaRegulag(size: 16)
        lable.textColor = Resources.Gradients.Standart.start
        lable.textAlignment = .left
        return lable
    }()
    
    let addressLable: UILabel = {
        let lable = UILabel()
        lable.text = Resources.Strings.Card.address
        lable.font = Resources.Fonts.helveticaRegulag(size: 16)
        lable.textColor = Resources.Gradients.Standart.start
        lable.textAlignment = .left
        return lable
    }()
    
    let codeLable: UILabel = {
        let lable = UILabel()
        lable.text = Resources.Strings.Card.code
        lable.font = Resources.Fonts.helveticaRegulag(size: 16)
        lable.textColor = Resources.Gradients.Standart.start
        lable.textAlignment = .left
        return lable
    }()
    
    let cityLable: UILabel = {
        let lable = UILabel()
        lable.text = Resources.Strings.Card.city
        lable.font = Resources.Fonts.helveticaRegulag(size: 16)
        lable.textColor = Resources.Gradients.Standart.start
        lable.textAlignment = .left
        return lable
    }()
    
    let button = BaseButton(title: Resources.Strings.Card.orderANewCard)
    
    //MARK: viewDidload
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = Resources.Strings.Card.deliveryAddress
        
        setupViews()
        setupConstraints()
        configureApperiens()
        
        button.addTarget(self, action: #selector(buttonTapped), for: .touchUpInside)
    }
    
    @objc func buttonTapped() {
        
        let countryTextValide = validateTextField(countryTextField)
        let addressTextValide = validateTextField(addressTextField)
        let codeTextValide = validateTextField(codeTextField)
        let cityTextValide = validateTextField(cityTextField)
        
        if countryTextValide && addressTextValide && codeTextValide && cityTextValide {
            
            let addDeliveryFinalController = DeliveryFinalContoller(roolUp: false)
            
            addDeliveryFinalController.hidesBottomBarWhenPushed = true
            navigationController?.pushViewController(addDeliveryFinalController, animated: true)
            
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
    
    private func validateTextField(_ textField: UITextField) -> Bool {
        
        guard let text = textField.text, !text.isEmpty else {
            return false
        }
        
        return true
    }
    
    private func showError(textField: UITextField) {
        
        textField.layer.borderColor = UIColor.red.cgColor
        textField.layer.borderWidth = 1.0
        shakeTextField(textField)
    }
    
    private func shakeTextField(_ textField: UITextField) {
        
        let animation = CABasicAnimation(keyPath: "position")
        
        animation.duration = 0.05
        animation.repeatCount = 4
        animation.autoreverses = true
        animation.fromValue = NSValue(cgPoint: CGPoint(x: textField.center.x - 10, y: textField.center.y))
        animation.toValue = NSValue(cgPoint: CGPoint(x: textField.center.x + 10, y: textField.center.y))
        textField.layer.add(animation, forKey: "position")
        
    }
}

//MARK: ext
extension DeliveryController {
    
    override func setupViews() {
        super.setupViews()
        
        view.addSubview(countryLable)
        view.addSubview(countryTextField)
        view.addSubview(addressLable)
        view.addSubview(addressTextField)
        view.addSubview(codeLable)
        view.addSubview(codeTextField)
        view.addSubview(cityLable)
        view.addSubview(cityTextField)
        view.addSubview(button)
        
    }
    
    override func setupConstraints() {
        super.setupConstraints()
        
        countryLable.translatesAutoresizingMaskIntoConstraints = false
        countryTextField.translatesAutoresizingMaskIntoConstraints = false
        addressLable.translatesAutoresizingMaskIntoConstraints = false
        addressTextField.translatesAutoresizingMaskIntoConstraints = false
        codeLable.translatesAutoresizingMaskIntoConstraints = false
        codeTextField.translatesAutoresizingMaskIntoConstraints = false
        cityLable.translatesAutoresizingMaskIntoConstraints = false
        cityTextField.translatesAutoresizingMaskIntoConstraints = false
        button.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            
            countryLable.topAnchor.constraint(equalTo: view.topAnchor, constant: 125),
            countryLable.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 28),
            
            countryTextField.topAnchor.constraint(equalTo: countryLable.bottomAnchor, constant: 10),
            countryTextField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 28),
            countryTextField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -28),
            countryTextField.heightAnchor.constraint(equalToConstant: 55),
            
            addressLable.topAnchor.constraint(equalTo: countryTextField.bottomAnchor, constant: 14),
            addressLable.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 28),
            
            addressTextField.topAnchor.constraint(equalTo: addressLable.bottomAnchor, constant: 10),
            addressTextField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 28),
            addressTextField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -28),
            addressTextField.heightAnchor.constraint(equalToConstant: 55),
            
            codeLable.topAnchor.constraint(equalTo: addressTextField.bottomAnchor, constant: 14),
            codeLable.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 28),
            
            codeTextField.topAnchor.constraint(equalTo: codeLable.bottomAnchor, constant: 10),
            codeTextField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 28),
            codeTextField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -28),
            codeTextField.heightAnchor.constraint(equalToConstant: 55),
            
            cityLable.topAnchor.constraint(equalTo: codeTextField.bottomAnchor, constant: 14),
            cityLable.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 28),
            
            cityTextField.topAnchor.constraint(equalTo: cityLable.bottomAnchor, constant: 10),
            cityTextField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 28),
            cityTextField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -28),
            cityTextField.heightAnchor.constraint(equalToConstant: 55),
            
            button.topAnchor.constraint(equalTo: cityTextField.bottomAnchor, constant: 22),
            button.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 28),
            button.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -28),
            button.heightAnchor.constraint(equalToConstant: 55),
            
        ])
        
    }
    
    override func configureApperiens() {
        super.configureApperiens()
        
        button.applyGradient(colorArray: [Resources.Gradients.Standart.start, Resources.Gradients.Standart.end], cornerRadius: 10)
    }
}

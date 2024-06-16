//
//  AddNewCardController.swift
//  InternationalBank
//
//  Created by Ангел предохранитель on 26.05.2024.
//

import UIKit

final class ImportCardController: BaseController {
    
    let card = CardView(cardType: .standart, 
                        cardName: Resources.Strings.Card.walletXYZ,
                        cardNumber: Resources.Strings.Card.secureCardNumber)
    
    let cardNameTextField = BaseTextField(placeholder: Resources.Strings.Card.walletXYZ)
    
    let cardNumberTextField = CardNumberTextField(placeholder: Resources.Strings.Card.secureCardNumber)
    
    let cardDateTextField = CardDateTextField(placeholder: Resources.Strings.Card.cardDate, alignment: .center)
    
    let cardCvvTextField = CardCvvTextField(placeholder: Resources.Strings.Card.cvv, alignment: .center)
    
    let lableCardName: UILabel = {
        let lable = UILabel()
        lable.text = Resources.Strings.Card.cardName
        lable.font = Resources.Fonts.helveticaRegulag(size: 16)
        lable.textColor = Resources.Gradients.Standart.start
        lable.textAlignment = .left
        return lable
    }()
    
    let lableCardNumber: UILabel = {
        let lable = UILabel()
        lable.text = Resources.Strings.Card.cardNumber
        lable.font = Resources.Fonts.helveticaRegulag(size: 16)
        lable.textColor = Resources.Gradients.Standart.start
        lable.textAlignment = .left
        return lable
    }()
    
    let redCirle: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor.red
        view.bounds.size = CGSize(width: 20, height: 20)
        view.layer.cornerRadius = view.bounds.width / 2
        return view
    }()
    
    let yellowCirle: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor.orange.withAlphaComponent(0.8)
        view.bounds.size = CGSize(width: 20, height: 20)
        view.layer.cornerRadius = view.bounds.width / 2
        return view
    }()
    
    let button = BaseButton(title: Resources.Strings.Card.save)
    
    //MARK: viewDidload
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = Resources.Strings.Card.cards
        navigationController?.tabBarItem.title = nil
        navigationItem.hidesBackButton = true
        
        setupViews()
        setupConstraints()
        configureApperiens()
        
        button.addTarget(self, action: #selector(buttonTapped), for: .touchUpInside)
       
    }
    
    //MARK: viewWillAppear
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        tabBarController?.tabBar.isHidden = false
    }
    
    @objc private func buttonTapped() {
        
        let cardNameValid = validateTextField(cardNameTextField)
        let cardNumberValid = validateCardNumber(cardNumberTextField.text)
        let cardDateValid = validateDate(cardDateTextField.text)
        let cardCvvValid = validateCardCVV(cardCvvTextField.text)
        
        if cardNameValid && cardNumberValid && cardDateValid && cardCvvValid {
            
            let addImportCardFinalController = ImportCardFinalController(roolUp: true)
            
            addImportCardFinalController.hidesBottomBarWhenPushed = true
            navigationController?.pushViewController(addImportCardFinalController, animated: true)
            
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
    
    private func validateTextField(_ textField: UITextField) -> Bool {
        
        guard let text = textField.text, !text.isEmpty else {
            return false
        }
        
        return true
    }
    
    private func validateCardNumber(_ cardNumber: String?) -> Bool {
        
        guard let cardNumber = cardNumber else { return false }
        
        let digitsOnly = cardNumber.replacingOccurrences(of: "\\D", with: "", options: .regularExpression)
        
        return digitsOnly.count == 16
    }
    
    private func validateDate(_ date: String?) -> Bool {
        
        guard let date = date else { return false }
        
        let dateRegex = "^(0[1-9]|1[0-2])/([0-9]{2})$"
        let datePredicate = NSPredicate(format: "SELF MATCHES %@", dateRegex)
        
        return datePredicate.evaluate(with: date)
    }
    
    private func validateCardCVV(_ cvv: String?) -> Bool {
        
        guard let cvv = cvv else { return false }
        
        let cvvRegex = "^[0-9]{3,4}$"
        let cvvPredicate = NSPredicate(format: "SELF MATCHES %@", cvvRegex)
        
        return cvvPredicate.evaluate(with: cvv)
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
extension ImportCardController {
    
    override func setupViews() {
        super.setupViews()
        
        view.addSubview(card)
        view.addSubview(lableCardName)
        view.addSubview(cardNameTextField)
        view.addSubview(lableCardNumber)
        view.addSubview(cardNumberTextField)
        view.addSubview(cardDateTextField)
        view.addSubview(cardCvvTextField)
        view.addSubview(button)
        view.addSubview(redCirle)
        view.addSubview(yellowCirle)
    }
    
    override func setupConstraints() {
        super.setupConstraints()
        
        card.translatesAutoresizingMaskIntoConstraints = false
        lableCardName.translatesAutoresizingMaskIntoConstraints = false
        cardNameTextField.translatesAutoresizingMaskIntoConstraints = false
        lableCardNumber.translatesAutoresizingMaskIntoConstraints = false
        cardNumberTextField.translatesAutoresizingMaskIntoConstraints = false
        cardDateTextField.translatesAutoresizingMaskIntoConstraints = false
        cardCvvTextField.translatesAutoresizingMaskIntoConstraints = false
        button.translatesAutoresizingMaskIntoConstraints = false
        redCirle.translatesAutoresizingMaskIntoConstraints = false
        yellowCirle.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            
            card.topAnchor.constraint(equalTo: view.topAnchor, constant: 119 - 28),
            card.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 28),
            
            lableCardName.topAnchor.constraint(equalTo: card.bottomAnchor, constant: 49),
            lableCardName.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 28),
            
            cardNameTextField.topAnchor.constraint(equalTo: lableCardName.bottomAnchor, constant: 14),
            cardNameTextField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 28),
            cardNameTextField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -28),
            cardNameTextField.heightAnchor.constraint(equalToConstant: 60),
            
            lableCardNumber.topAnchor.constraint(equalTo: cardNameTextField.bottomAnchor, constant: 28),
            lableCardNumber.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 28),
            
            cardNumberTextField.topAnchor.constraint(equalTo: lableCardNumber.bottomAnchor, constant: 14),
            cardNumberTextField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 28),
            cardNumberTextField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -28),
            cardNumberTextField.heightAnchor.constraint(equalToConstant: 60),
            
            cardDateTextField.topAnchor.constraint(equalTo: cardNumberTextField.bottomAnchor, constant: 23),
            cardDateTextField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 28),
            cardDateTextField.heightAnchor.constraint(equalToConstant: 60),
            cardDateTextField.widthAnchor.constraint(equalToConstant: 150),
            
            cardCvvTextField.topAnchor.constraint(equalTo: cardNumberTextField.bottomAnchor, constant: 23),
            cardCvvTextField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -28),
            cardCvvTextField.heightAnchor.constraint(equalToConstant: 60),
            cardCvvTextField.widthAnchor.constraint(equalToConstant: 150),
            
            button.topAnchor.constraint(equalTo: cardDateTextField.bottomAnchor, constant: 46),
            button.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 28),
            button.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -28),
            button.heightAnchor.constraint(equalToConstant: 41),
            
            redCirle.trailingAnchor.constraint(equalTo: cardNumberTextField.trailingAnchor, constant: -31),
            redCirle.topAnchor.constraint(equalTo: cardNumberTextField.topAnchor, constant: 20),
            redCirle.bottomAnchor.constraint(equalTo: cardNumberTextField.bottomAnchor, constant: -20),
            redCirle.heightAnchor.constraint(equalToConstant: 20),
            redCirle.widthAnchor.constraint(equalToConstant: 20),
            
            yellowCirle.topAnchor.constraint(equalTo: cardNumberTextField.topAnchor, constant: 20),
            yellowCirle.trailingAnchor.constraint(equalTo: cardNumberTextField.trailingAnchor, constant: -18),
            yellowCirle.bottomAnchor.constraint(equalTo: cardNumberTextField.bottomAnchor, constant: -20),
            yellowCirle.heightAnchor.constraint(equalToConstant: 20),
            yellowCirle.widthAnchor.constraint(equalToConstant: 20),
            
        ])
    }
    
    override func configureApperiens() {
        super.configureApperiens()
        
        addNavBarButton(position: .right, icon: Resources.Image.Common.settingsGear!)
        
        button.applyGradient(colorArray: [Resources.Gradients.Standart.start, Resources.Gradients.Standart.end], cornerRadius: 10)
    }
}





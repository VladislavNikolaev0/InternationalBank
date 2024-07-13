//
//  DeliveryController.swift
//  InternationalBank
//
//  Created by Ангел предохранитель on 11.06.2024.
//

import UIKit

protocol DeliveryViewProtocol: AnyObject {
    
    func navigateToFinalController()
    
}

final class DeliveryController: BaseController, DeliveryViewProtocol {
    
    var presenter: DeliveryPresenterProtocol!
    
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
    
    //MARK: - init
    init(presenter: DeliveryPresenterProtocol!) {
        
        super.init(nibName: nil, bundle: nil)
        
        self.presenter = presenter
        
    }
    
    required init?(coder: NSCoder) {
        
        super.init(coder: coder)
        
    }
    
    //MARK: - viewDidload
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        title = Resources.Strings.Card.deliveryAddress
        
        setupViews()
        setupConstraints()
        configureApperiens()
        
        button.addTarget(self, action: #selector(buttonTapped), for: .touchUpInside)
        
        navigationItem.hidesBackButton = true
        
    }
    
    @objc func buttonTapped() {
        
        presenter.buttonTapped(countryTextField: countryTextField,
                               addressTextField: addressTextField,
                               codeTextField: codeTextField,
                               cityTextField: cityTextField)
        
    }
    
    override func leftButtonTapped() {
        
        super.leftButtonTapped()
        
        guard let navigationController = navigationController else { return }
        
        navigationController.popViewController(animated: true)
        
    }
    
    func navigateToFinalController(){
        
        let addDeliveryFinalController = DeliveryFinalContoller(roolUp: true)
        
        addDeliveryFinalController.hidesBottomBarWhenPushed = true
        
        navigationController?.pushViewController(addDeliveryFinalController, animated: true)
        
    }
    
}

//MARK: - ext
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
        
        addNavBarButton(position: .left, icon: Resources.Image.Common.arrowNavBar!)
        
    }
}

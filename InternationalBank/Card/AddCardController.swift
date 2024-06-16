//
//  AddCardView.swift
//  InternationalBank
//
//  Created by Ангел предохранитель on 20.05.2024.
//

import UIKit

final class AddCardController: BaseController {
    
    let backgroundImage: UIImageView = {
        let view = UIImageView()
        view.image = Resources.Image.Common.background
        return view
    }()
    
    let image: UIImageView = {
        let view = UIImageView()
        view.image = Resources.Image.Common.euroExchange
        return view
    }()
    
    let buttonOrder = BaseButton(title: Resources.Strings.Card.orderANewCard)
    let buttonImpor = BaseButton(title: Resources.Strings.Card.importCard)
    
    //MARK: viewDidload
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupViews()
        setupConstraints()
        configureApperiens()
        
        buttonImpor.addTarget(self, action: #selector(importButtonTapped), for: .touchUpInside)
        buttonOrder.addTarget(self, action: #selector(orderButtonTapped), for: .touchUpInside)
    }
    
    override func leftButtonTapped() {
        super.leftButtonTapped()
        print("Left button tapped in AddCardController")
        
        
        guard let navigationController = navigationController else {
            print("No navigation controller found")
            return
        }
        
        navigationController.popViewController(animated: true)
    }
    
    @objc private func importButtonTapped() {
        
        let importController = ImportCardController()
        importController.hidesBottomBarWhenPushed = false
        print("Navigating to ImportCardController")
        navigationController?.pushViewController(importController, animated: true)
        
    }
    
    @objc private func orderButtonTapped() {
        
        let orderCardController = OrderCardController()
        orderCardController.hidesBottomBarWhenPushed = false
        navigationController?.pushViewController(orderCardController, animated: true)
        
    }
}

//MARK: ext
extension AddCardController {
    
    override func setupViews() {
        super.setupViews()
        
        view.addSubview(backgroundImage)
        view.addSubview(image)
        view.addSubview(buttonOrder)
        view.addSubview(buttonImpor)
    }
    
    override func setupConstraints() {
        super.setupConstraints()
        
        backgroundImage.translatesAutoresizingMaskIntoConstraints = false
        image.translatesAutoresizingMaskIntoConstraints = false
        buttonOrder.translatesAutoresizingMaskIntoConstraints = false
        buttonImpor.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            
            backgroundImage.topAnchor.constraint(equalTo: view.topAnchor),
            backgroundImage.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            backgroundImage.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            backgroundImage.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            
            image.topAnchor.constraint(equalTo: view.topAnchor, constant: 170),
            image.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 65),
            image.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -65),
            image.heightAnchor.constraint(equalToConstant: 39),
            
            buttonOrder.topAnchor.constraint(equalTo: view.centerYAnchor, constant: 77),
            buttonOrder.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 34),
            buttonOrder.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -34),
            buttonOrder.heightAnchor.constraint(equalToConstant: 50),
            
            buttonImpor.topAnchor.constraint(equalTo: buttonOrder.bottomAnchor, constant: 20),
            buttonImpor.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 34),
            buttonImpor.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -34),
            buttonImpor.heightAnchor.constraint(equalToConstant: 50),
            
        ])
    }
    
    override func configureApperiens() {
        super.configureApperiens()
        
        addNavBarButton(position: .left, icon: Resources.Image.Common.arrowNavBar!)
        
        buttonOrder.applyGradient(colorArray: [Resources.Gradients.Standart.start, Resources.Gradients.Standart.end], cornerRadius: 10)
        buttonImpor.applyGradient(colorArray: [Resources.Gradients.Standart.start, Resources.Gradients.Standart.end], cornerRadius: 10)
    }
}

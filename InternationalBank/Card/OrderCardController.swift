//
//  OrderCardController.swift
//  InternationalBank
//
//  Created by Ангел предохранитель on 10.06.2024.
//

import UIKit

class OrderCardController: BaseController {
    
    private let standartCard = MiniCard(type: .standart)
    private let proCard = MiniCard(type: .pro)
    private let metalCard = MiniCard(type: .metal)
    
    private let standartLable: UILabel = {
        let lable = UILabel()
        lable.text = Resources.Strings.Card.standart
        lable.textAlignment = .right
        lable.font = Resources.Fonts.helveticaRegulag(size: 16)
        return lable
    }()
    
    private let proLable: UILabel = {
        let lable = UILabel()
        lable.text = Resources.Strings.Card.pro
        lable.textAlignment = .right
        lable.font = Resources.Fonts.helveticaRegulag(size: 16)
        return lable
    }()
    
    private let metalLable: UILabel = {
        let lable = UILabel()
        lable.text = Resources.Strings.Card.metal
        lable.textAlignment = .right
        lable.font = Resources.Fonts.helveticaRegulag(size: 16)
        return lable
    }()
    
    private let standartStack: UIStackView = {
        let stack = UIStackView()
        stack.axis = .horizontal
        stack.alignment = .center
        stack.distribution = .equalSpacing
        return stack
    }()
    
    private let proStack: UIStackView = {
        let stack = UIStackView()
        stack.axis = .horizontal
        stack.alignment = .center
        stack.distribution = .equalSpacing
        return stack
    }()
    
    private let metalStack: UIStackView = {
        let stack = UIStackView()
        stack.axis = .horizontal
        stack.alignment = .center
        stack.distribution = .equalSpacing
        return stack
    }()
    
    //MARK: viewDidload
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = Resources.Strings.Card.orderANewCard
        navigationItem.hidesBackButton = true
        
        setupViews()
        setupConstraints()
        configureApperiens()
        
        addGestureRecognized()
    }
    
    //MARK: viewWillAppear
    override func viewWillAppear(_ animated: Bool) {
        
        super.viewWillAppear(animated)
        
        tabBarController?.tabBar.isHidden = false
        
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
    
    private func addGestureRecognized() {
        
        let standartTap = UITapGestureRecognizer(target: self, action: #selector(stackTapped))
        let proTap = UITapGestureRecognizer(target: self, action: #selector(stackTapped))
        let metalTap = UITapGestureRecognizer(target: self, action: #selector(stackTapped))
        
        standartStack.addGestureRecognizer(standartTap)
        proStack.addGestureRecognizer(proTap)
        metalStack.addGestureRecognizer(metalTap)
    }
    
    
    @objc private func stackTapped() {
        
        let deliveryController = DeliveryController()
        navigationController?.pushViewController(deliveryController, animated: true)
    }
}

//MARK: ext
extension OrderCardController {
    
    override func setupViews() {
        super.setupViews()
        
        view.addSubview(standartStack)
        view.addSubview(proStack)
        view.addSubview(metalStack)
        
        standartStack.addArrangedSubview(standartLable)
        standartStack.addArrangedSubview(standartCard)
        
        proStack.addArrangedSubview(proLable)
        proStack.addArrangedSubview(proCard)
        
        metalStack.addArrangedSubview(metalLable)
        metalStack.addArrangedSubview(metalCard)
    }
    
    override func setupConstraints() {
        super.setupConstraints()
        
        standartStack.translatesAutoresizingMaskIntoConstraints = false
        proStack.translatesAutoresizingMaskIntoConstraints = false
        metalStack.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            standartStack.topAnchor.constraint(equalTo: view.topAnchor, constant: 153),
            standartStack.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 40),
            standartStack.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -40),
            standartStack.heightAnchor.constraint(equalToConstant: 50),
            
            proStack.topAnchor.constraint(equalTo: standartStack.bottomAnchor, constant: 29),
            proStack.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 40),
            proStack.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -40),
            proStack.heightAnchor.constraint(equalToConstant: 50),
            
            metalStack.topAnchor.constraint(equalTo: proStack.bottomAnchor, constant: 29),
            metalStack.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 40),
            metalStack.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -40),
            metalStack.heightAnchor.constraint(equalToConstant: 50),
            
            standartLable.leadingAnchor.constraint(equalTo: standartStack.leadingAnchor),
            standartCard.trailingAnchor.constraint(equalTo: standartStack.trailingAnchor),
            
            proLable.leadingAnchor.constraint(equalTo: proStack.leadingAnchor),
            proCard.trailingAnchor.constraint(equalTo: proStack.trailingAnchor),
            
            metalLable.leadingAnchor.constraint(equalTo: metalStack.leadingAnchor),
            metalCard.trailingAnchor.constraint(equalTo: metalStack.trailingAnchor),
        ])
    }
    
    override func configureApperiens() {
        super.configureApperiens()
        
        addSeparator(stack: standartStack)
        addSeparator(stack: proStack)
        
        addNavBarButton(position: .left, icon: Resources.Image.Common.arrowNavBar!)
    }
    
    private func addSeparator(stack: UIStackView) {
        let separator = UIView()
        separator.backgroundColor = Resources.Colors.separator
        view.addSubview(separator)
        
        separator.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            
            separator.topAnchor.constraint(equalTo: stack.bottomAnchor, constant: 14),
            separator.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 40),
            separator.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -40),
            separator.heightAnchor.constraint(equalToConstant: 1),
            
        ])
    }
    
}

//
//  ChoseCardController.swift
//  InternationalBank
//
//  Created by Ангел предохранитель on 03.07.2024.
//

import UIKit

protocol ChoseCardViewProtocol: AnyObject {
    
    //TODO: следующие методы измениения карты и пина (?)
    
}

final class ChoseCardController: BaseController, ChoseCardViewProtocol {
    
    var presenter: ChoseCardPresenterProtocol!
    
    let scrollView: UIScrollView = {
        let scroll = UIScrollView()
        scroll.showsVerticalScrollIndicator = false
        return scroll
    }()
    
    let contentView: UIView = {
        let view = UIView()
        view.backgroundColor = Resources.Colors.background
        return view
    }()
    
    let card = ChoseCardView(cardType: .standart,
                             name: Resources.Strings.Card.walletXYZ,
                             number: Resources.Strings.Card.numberCardExample,
                             date: Resources.Strings.Card.cardDate,
                             cvv: Resources.Strings.Card.cvvCardExample)
    
    let activateCardLabel: UILabel = {
        let lable = UILabel()
        lable.text = Resources.Strings.Card.activateCard
        lable.font = Resources.Fonts.helveticaRegulag(size: 16)
        lable.textColor = Resources.Gradients.Standart.start
        lable.textAlignment = .left
        return lable
    }()
    
    let activateCardToggle = BaseToggle(
        frame: CGRect(x: 0, y: 0, width: 57, height: 28),
        isOn: true,
        key: "activateCard")
    
    let changePinButton = BaseButton(title: Resources.Strings.Card.changePin)
    
    let changeCardButton = BaseButton(title: Resources.Strings.Card.changeCard)
    
    let onlineShopingLable: UILabel = {
        let lable = UILabel()
        lable.text = Resources.Strings.Card.onlineShoping
        lable.font = Resources.Fonts.helveticaRegulag(size: 16)
        lable.textColor = Resources.Gradients.Standart.start
        lable.textAlignment = .left
        return lable
    }()
    
    let onlineShopingToggle = BaseToggle(
        frame: CGRect(x: 0, y: 0, width: 57, height: 28),
        isOn: true,
        key: "onlineShoping")
    
    let digitalCardLable: UILabel = {
        let lable = UILabel()
        lable.text = Resources.Strings.Card.digitalCard
        lable.font = Resources.Fonts.helveticaRegulag(size: 16)
        lable.textColor = Resources.Gradients.Standart.start
        lable.textAlignment = .left
        return lable
    }()
    
    let applePayButton = BaseButton(title: Resources.Strings.Card.applePay)
    
    let limintsLable: UILabel = {
        let lable = UILabel()
        lable.text = Resources.Strings.Card.limits
        lable.font = Resources.Fonts.helveticaRegulag(size: 16)
        lable.textColor = Resources.Gradients.Standart.start
        lable.textAlignment = .left
        return lable
    }()
    
    let limitDayLable: UILabel = {
        let lable = UILabel()
        lable.text = Resources.Strings.Card.dayLimit
        lable.font = Resources.Fonts.helveticaItalic(size: 16)
        lable.textColor = Resources.Gradients.Standart.start.withAlphaComponent(0.7)
        lable.textAlignment = .left
        return lable
    }()
    
    let limitMonthLable: UILabel = {
        let lable = UILabel()
        lable.text = Resources.Strings.Card.monthLimit
        lable.font = Resources.Fonts.helveticaItalic(size: 16)
        lable.textColor = Resources.Gradients.Standart.start.withAlphaComponent(0.7)
        lable.textAlignment = .left
        return lable
    }()
    
    let dayLable: UILabel = {
        let lable = UILabel()
        lable.text = Resources.Strings.Card.day
        lable.font = Resources.Fonts.helveticaItalic(size: 16)
        lable.textColor = Resources.Gradients.Standart.start.withAlphaComponent(0.7)
        lable.textAlignment = .right
        return lable
    }()
    
    let monthLable: UILabel = {
        let lable = UILabel()
        lable.text = Resources.Strings.Card.month
        lable.font = Resources.Fonts.helveticaItalic(size: 16)
        lable.textColor = Resources.Gradients.Standart.start.withAlphaComponent(0.7)
        lable.textAlignment = .right
        return lable
    }()
    
    let activateCardStack: UIStackView = {
        let stack = UIStackView()
        stack.axis = .horizontal
        stack.distribution = .equalSpacing
        return stack
    }()
    
    let onlineShopingStack: UIStackView = {
        let stack = UIStackView()
        stack.axis = .horizontal
        stack.distribution = .equalSpacing
        return stack
    }()
    
    //MARK: - init
    init(presenter: ChoseCardPresenterProtocol!) {
        
        super.init(nibName: nil, bundle: nil)
        
        self.presenter = presenter
        
    }
    
    required init?(coder: NSCoder) {
    
        super.init(coder: coder)
        
    }
    
    //MARK: - viewDidLoad
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        navigationController?.tabBarItem.title = nil
        navigationItem.hidesBackButton = true
        
        setupViews()
        setupConstraints()
        configureApperiens()
        
    }
    
    //MARK: - viewWillAppear
    override func viewWillAppear(_ animated: Bool) {
        
        super.viewWillAppear(animated)
        
        tabBarController?.tabBar.isHidden = false
        
    }
    
    override func leftButtonTapped() {
        
        super.leftButtonTapped()
        
        guard let navigationController = navigationController else { return }
        
        navigationController.popViewController(animated: true)
        
    }
    
}

extension ChoseCardController {
    
    override func setupViews() {
        
        super.setupViews()
        
        view.addSubview(scrollView)
        scrollView.addSubview(contentView)
        
        contentView.addSubview(card)
        contentView.addSubview(activateCardStack)
        
        activateCardStack.addArrangedSubview(activateCardLabel)
        activateCardStack.addArrangedSubview(activateCardToggle)
        
        contentView.addSubview(changePinButton)
        contentView.addSubview(changeCardButton)
        contentView.addSubview(onlineShopingStack)
        
        onlineShopingStack.addArrangedSubview(onlineShopingLable)
        onlineShopingStack.addArrangedSubview(onlineShopingToggle)
        
        contentView.addSubview(digitalCardLable)
        contentView.addSubview(applePayButton)
        contentView.addSubview(limintsLable)
        contentView.addSubview(limitDayLable)
        contentView.addSubview(limitMonthLable)
        contentView.addSubview(dayLable)
        contentView.addSubview(monthLable)
        
    }
    
    override func setupConstraints() {
        
        super.setupConstraints()
        
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        contentView.translatesAutoresizingMaskIntoConstraints = false
        card.translatesAutoresizingMaskIntoConstraints = false
        activateCardStack.translatesAutoresizingMaskIntoConstraints = false
        activateCardLabel.translatesAutoresizingMaskIntoConstraints = false
        activateCardToggle.translatesAutoresizingMaskIntoConstraints = false
        changePinButton.translatesAutoresizingMaskIntoConstraints = false
        changeCardButton.translatesAutoresizingMaskIntoConstraints = false
        onlineShopingStack.translatesAutoresizingMaskIntoConstraints = false
        onlineShopingLable.translatesAutoresizingMaskIntoConstraints = false
        onlineShopingToggle.translatesAutoresizingMaskIntoConstraints = false
        digitalCardLable.translatesAutoresizingMaskIntoConstraints = false
        applePayButton.translatesAutoresizingMaskIntoConstraints = false
        limintsLable.translatesAutoresizingMaskIntoConstraints = false
        limitDayLable.translatesAutoresizingMaskIntoConstraints = false
        limitMonthLable.translatesAutoresizingMaskIntoConstraints = false
        dayLable.translatesAutoresizingMaskIntoConstraints = false
        monthLable.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            
            scrollView.topAnchor.constraint(equalTo: view.topAnchor, constant: 89),
            scrollView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            scrollView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            scrollView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
        
            contentView.topAnchor.constraint(equalTo: scrollView.topAnchor),
            contentView.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor),
            contentView.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor),
            contentView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor),
            contentView.heightAnchor.constraint(equalTo: scrollView.heightAnchor),
            contentView.widthAnchor.constraint(equalTo: scrollView.widthAnchor),
            
            card.topAnchor.constraint(equalTo: contentView.topAnchor),
            card.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 24),
            card.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -24),
            card.heightAnchor.constraint(equalToConstant: 175),
            card.widthAnchor.constraint(equalToConstant: 328),
            
            activateCardStack.topAnchor.constraint(equalTo: card.bottomAnchor, constant: 28),
            activateCardStack.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 38),
            activateCardStack.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -38),
            activateCardStack.heightAnchor.constraint(equalToConstant: 28),
            
            activateCardToggle.heightAnchor.constraint(equalToConstant: 28),
            activateCardToggle.widthAnchor.constraint(equalToConstant: 52),
            
            changePinButton.topAnchor.constraint(equalTo: activateCardStack.bottomAnchor, constant: 32),
            changePinButton.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 38),
            changePinButton.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -38),
            changePinButton.heightAnchor.constraint(equalToConstant: 50),
            
            changeCardButton.topAnchor.constraint(equalTo: changePinButton.bottomAnchor, constant: 15),
            changeCardButton.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 38),
            changeCardButton.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -38),
            changeCardButton.heightAnchor.constraint(equalToConstant: 50),
            
            onlineShopingStack.topAnchor.constraint(equalTo: changeCardButton.bottomAnchor, constant: 15),
            onlineShopingStack.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 38),
            onlineShopingStack.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -38),
            onlineShopingStack.heightAnchor.constraint(equalToConstant: 28),
            
            onlineShopingToggle.heightAnchor.constraint(equalToConstant: 28),
            onlineShopingToggle.widthAnchor.constraint(equalToConstant: 52),
            
            digitalCardLable.topAnchor.constraint(equalTo: onlineShopingStack.bottomAnchor, constant: 25),
            digitalCardLable.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 38),
            
            applePayButton.topAnchor.constraint(equalTo: digitalCardLable.bottomAnchor, constant: 10),
            applePayButton.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 38),
            applePayButton.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -38),
            applePayButton.heightAnchor.constraint(equalToConstant: 50),
            
            limintsLable.topAnchor.constraint(equalTo: applePayButton.bottomAnchor, constant: 20),
            limintsLable.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 38),
            
            limitDayLable.topAnchor.constraint(equalTo: limintsLable.bottomAnchor, constant: 15),
            limitDayLable.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 38),
            
            limitMonthLable.topAnchor.constraint(equalTo: limitDayLable.bottomAnchor, constant: 15),
            limitMonthLable.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 38),
            
            dayLable.topAnchor.constraint(equalTo: limitDayLable.topAnchor),
            dayLable.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -38),
            
            monthLable.topAnchor.constraint(equalTo: limitMonthLable.topAnchor),
            monthLable.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -38),
            
        ])
        
    }
    
    override func configureApperiens() {
        
        super.configureApperiens()
        
        addNavBarButton(position: .left, icon: Resources.Image.Common.arrowNavBar! )
        
        addNavBarButton(position: .right, icon: Resources.Image.Common.settingsGear!)
        
        card.applyGradient(colorArray: [Resources.Gradients.Standart.start, Resources.Gradients.Standart.end], cornerRadius: 14)
        
        [
            
            changeCardButton,
            changePinButton,
            applePayButton
            
        ].forEach{
            
            $0.applyGradient(colorArray: [Resources.Gradients.Standart.start, Resources.Gradients.Standart.end], cornerRadius: 10)
            
        }
        
        activateCardStack.addSeparator(padding: 15, infinite: false)
        onlineShopingStack.addSeparator(padding: 15, infinite: false)
        applePayButton.addSeparator(padding: 8, infinite: true)
        
    }
    
}

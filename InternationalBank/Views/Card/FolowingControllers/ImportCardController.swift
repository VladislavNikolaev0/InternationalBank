//
//  AddNewCardController.swift
//  InternationalBank
//
//  Created by Ангел предохранитель on 26.05.2024.
//

import UIKit

protocol ImportCardViewProtocol: AnyObject {
    
    func navigateToFinalContoller()
    
    //TODO: функция сохранения карты
}

final class ImportCardController: BaseController, ImportCardViewProtocol {
    
    var presenter: ImportCardPresenterProtocol!
    
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
    
    //MARK: - init
    init(presenter: ImportCardPresenterProtocol!) {
        
        super.init(nibName: nil, bundle: nil)
        
        self.presenter = presenter
        
    }
    
    required init?(coder: NSCoder) {
        
        super.init(coder: coder)
        
    }
    
    //MARK: - viewDidload
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
    
    //MARK: - viewWillAppear
    override func viewWillAppear(_ animated: Bool) {
        
        super.viewWillAppear(animated)
        
        tabBarController?.tabBar.isHidden = false
        
    }
    
    @objc private func buttonTapped() {
        
        presenter.buttonTapped(cardNameTextField: cardNameTextField,
                               cardNumberTextFeild: cardNumberTextField,
                               cardDateTextField: cardDateTextField,
                               cardCVVTextField: cardCvvTextField)
        
    }
    
    
    func navigateToFinalContoller() {
        
        let addImportCardFinalController = ImportCardFinalController(roolUp: true)
        
        addImportCardFinalController.hidesBottomBarWhenPushed = true
        
        navigationController?.pushViewController(addImportCardFinalController, animated: true)
        
    }
    
}

//MARK: - ext
extension ImportCardController {
    
    override func setupViews() {
        
        super.setupViews()
        
        view.addSubview(scrollView)
        
        scrollView.addSubview(contentView)
        
        contentView.addSubview(card)
        contentView.addSubview(lableCardName)
        contentView.addSubview(cardNameTextField)
        contentView.addSubview(lableCardNumber)
        contentView.addSubview(cardNumberTextField)
        contentView.addSubview(cardDateTextField)
        contentView.addSubview(cardCvvTextField)
        contentView.addSubview(button)
        contentView.addSubview(redCirle)
        contentView.addSubview(yellowCirle)
        
    }
    
    override func setupConstraints() {
        
        super.setupConstraints()
        
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        contentView.translatesAutoresizingMaskIntoConstraints = false
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
            
            scrollView.topAnchor.constraint(equalTo: view.topAnchor, constant: 91),
            scrollView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            scrollView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            scrollView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            
            contentView.topAnchor.constraint(equalTo: scrollView.topAnchor),
            contentView.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor),
            contentView.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor),
            contentView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor),
            contentView.widthAnchor.constraint(equalTo: scrollView.widthAnchor),
            contentView.heightAnchor.constraint(equalTo: scrollView.heightAnchor),
            
            card.topAnchor.constraint(equalTo: contentView.topAnchor),
            card.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 28),
            
            lableCardName.topAnchor.constraint(equalTo: card.bottomAnchor, constant: 49),
            lableCardName.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 28),
            
            cardNameTextField.topAnchor.constraint(equalTo: lableCardName.bottomAnchor, constant: 14),
            cardNameTextField.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 28),
            cardNameTextField.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -28),
            cardNameTextField.heightAnchor.constraint(equalToConstant: 60),
            
            lableCardNumber.topAnchor.constraint(equalTo: cardNameTextField.bottomAnchor, constant: 28),
            lableCardNumber.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 28),
            
            cardNumberTextField.topAnchor.constraint(equalTo: lableCardNumber.bottomAnchor, constant: 14),
            cardNumberTextField.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 28),
            cardNumberTextField.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -28),
            cardNumberTextField.heightAnchor.constraint(equalToConstant: 60),
            
            cardDateTextField.topAnchor.constraint(equalTo: cardNumberTextField.bottomAnchor, constant: 23),
            cardDateTextField.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 28),
            cardDateTextField.heightAnchor.constraint(equalToConstant: 60),
            cardDateTextField.widthAnchor.constraint(equalToConstant: 150),
            
            cardCvvTextField.topAnchor.constraint(equalTo: cardNumberTextField.bottomAnchor, constant: 23),
            cardCvvTextField.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -28),
            cardCvvTextField.heightAnchor.constraint(equalToConstant: 60),
            cardCvvTextField.widthAnchor.constraint(equalToConstant: 150),
            
            button.topAnchor.constraint(equalTo: cardDateTextField.bottomAnchor, constant: 46),
            button.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 28),
            button.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -28),
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





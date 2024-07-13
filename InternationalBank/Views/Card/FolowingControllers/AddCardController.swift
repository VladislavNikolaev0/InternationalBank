//
//  AddCardView.swift
//  InternationalBank
//
//  Created by Ангел предохранитель on 20.05.2024.
//

import UIKit

protocol AddCardViewProtocol: AnyObject {
    
    func navigateToImportCardController()
    
    func navigateToOrederCardController()
}

final class AddCardController: BaseController, AddCardViewProtocol {
    
    var presenter: AddCardPresenter!
    
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
    
    //MARK: - init
    init(presenter: AddCardPresenter!) {
        
        super.init(nibName: nil, bundle: nil)
        
        self.presenter = presenter
        
    }
    
    required init?(coder: NSCoder) {
        
        super.init(coder: coder)
        
    }
    
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
        
        guard let navigationController = navigationController else { return }
        
        navigationController.popViewController(animated: true)
        
    }
    
    @objc private func importButtonTapped() {
        
        presenter.importButtonTapped()
        
    }
    
    @objc private func orderButtonTapped() {
        
        presenter.orderButtonTapped()
        
    }
    
    func navigateToImportCardController() {
        
        let importController = ImportCardController(presenter: nil)
        let importPresenter = ImportCardPresenter(view: importController)
        importController.presenter = importPresenter
        
        importController.hidesBottomBarWhenPushed = false
        
        navigationController?.pushViewController(importController, animated: true)
        
    }
    
    func navigateToOrederCardController() {
        
        let orderCardController = OrderCardController(presenter: nil)
        let orderCardPresenter = OrderCardPresenter(view: orderCardController)
        orderCardController.presenter = orderCardPresenter
        
        orderCardController.hidesBottomBarWhenPushed = false
        
        navigationController?.pushViewController(orderCardController, animated: true)
        
    }
    
}

//MARK: - ext
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
        
        addNavBarButton(position: .left,
                        icon: Resources.Image.Common.arrowNavBar!)
        
        buttonOrder.applyGradient(
            colorArray: [Resources.Gradients.Standart.start,
                         Resources.Gradients.Standart.end],
            cornerRadius: 10)
        
        buttonImpor.applyGradient(
            colorArray: [Resources.Gradients.Standart.start,
                         Resources.Gradients.Standart.end],
            cornerRadius: 10)
        
    }
    
}

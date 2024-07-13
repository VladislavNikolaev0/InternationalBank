//
//  TransactionController.swift
//  InternationalBank
//
//  Created by Ангел предохранитель on 19.05.2024.
//

import UIKit

protocol TransactionViewProtocol: AnyObject {
    
    
    
}

final class TransactionController: BaseController, TransactionViewProtocol {
    
    var presenter: TransactionPresenterProtocol!
    
    //MARK: - init
    init(presenter: TransactionPresenterProtocol! ) {
        
        super.init(nibName: nil, bundle: nil)
        
        self.presenter = presenter
        
    }
    
    required init?(coder: NSCoder) {
        
        super.init(coder: coder)
        
    }
    
    //MARK: - viewDidLoad
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        setupViews()
        setupConstraints()
        configureApperiens()
        
    }
    
}

//MARK: - ext
extension TransactionController {
    
    override func setupViews() {
        
        super.setupViews()
        
    }
    
    override func setupConstraints() {
        
        super.setupConstraints()
        
    }
    
    override func configureApperiens() {
        
        super.configureApperiens()
        
    }
    
}

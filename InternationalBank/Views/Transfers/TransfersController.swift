//
//  File.swift
//  InternationalBank
//
//  Created by Ангел предохранитель on 19.05.2024.
//

import UIKit

protocol TransfersViewProtocol: AnyObject {
    
    
    
}

final class TransfersController: BaseController, TransfersViewProtocol {
    
    var presenter: TransfersPresenterProtocol!
    
    //MARK: - init
    init(presenter: TransfersPresenterProtocol!) {
        
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
extension TransfersController {
    
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

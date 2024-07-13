//
//  MainController.swift
//  InternationalBank
//
//  Created by Ангел предохранитель on 19.05.2024.
//

import UIKit

protocol MainViewProtocol: AnyObject {
    
    
    
}

final class MainController: BaseController, MainViewProtocol {
    
    var presenter: MainPresenterProtocol!
    
    //MARK: - init
    init(presenter: MainPresenterProtocol!) {
        
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
extension MainController {
    
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

//
//  MailController.swift
//  InternationalBank
//
//  Created by Ангел предохранитель on 19.05.2024.
//

import UIKit

protocol MailViewProtocol: AnyObject {
    
    
    
}

final class MailController: BaseController, MailViewProtocol {
    
    var presenter: MailPresenterProtocol!
    
    //MARK: - init
    init(presenter: MailPresenterProtocol!) {
        
        super.init(nibName: nil, bundle: nil)
        
        self.presenter = presenter
        
    }
    
    required init?(coder: NSCoder) {
        
        super.init(coder: coder)
        
    }
    
    //MARK: - viewDidLoad
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
    }
    
}

//MARK: - ext
extension MailController {
    
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

//
//  MailPresenter.swift
//  InternationalBank
//
//  Created by Ангел предохранитель on 23.06.2024.
//

import UIKit

protocol MailPresenterProtocol: AnyObject {
    
    //TODO: Функции для презентора мейла
    
}

final class MailPresenter: MailPresenterProtocol {
    
    weak var view: MailViewProtocol!
    
    //MARK: init
    init(view: MailViewProtocol) {
        self.view = view
        
    }
}

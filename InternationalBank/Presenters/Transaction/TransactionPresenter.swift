//
//  TransactionPresenter.swift
//  InternationalBank
//
//  Created by Ангел предохранитель on 23.06.2024.
//

import UIKit

protocol TransactionPresenterProtocol: AnyObject {
    
    //TODO: функции для презентора транзакеций
    
}

final class TransactionPresenter: TransactionPresenterProtocol {
    
    weak var view: TransactionViewProtocol!
    
    //MARK: init
    init(view: TransactionViewProtocol) {
        self.view = view
        
    }
    
}

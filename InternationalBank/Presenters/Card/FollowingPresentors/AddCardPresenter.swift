//
//  AddCardPresenter.swift
//  InternationalBank
//
//  Created by Ангел предохранитель on 27.06.2024.
//

import UIKit

protocol AddCardPresenterProtocol: AnyObject {
    
    func importButtonTapped()
    
    func orderButtonTapped()
    
}

final class AddCardPresenter: AddCardPresenterProtocol {
    
    weak var view: AddCardViewProtocol?
    
    //MARK: - init
    init(view: AddCardViewProtocol){
        
        self.view = view
        
    }
    
    func importButtonTapped() {
        
        view?.navigateToImportCardController()

    }
    
    func orderButtonTapped() {
        
        view?.navigateToOrederCardController()
        
    }
}

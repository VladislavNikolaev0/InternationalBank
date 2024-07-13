//
//  TransfersPresenter.swift
//  InternationalBank
//
//  Created by Ангел предохранитель on 23.06.2024.
//

import UIKit

protocol TransfersPresenterProtocol: AnyObject {
    
    //TODO: функции для презентора трансферов
    
}

final class TransfersPresenter: TransfersPresenterProtocol {
    
    weak var view: TransfersViewProtocol!
    
    //MARK: inti
    init(view: TransfersViewProtocol) {
        self.view = view
        
    }
}

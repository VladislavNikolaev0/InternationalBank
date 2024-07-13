//
//  ChoseCardPresenter.swift
//  InternationalBank
//
//  Created by Ангел предохранитель on 04.07.2024.
//

import UIKit

protocol ChoseCardPresenterProtocol: AnyObject {
    
    
    
}

final class ChoseCardPresenter: ChoseCardPresenterProtocol {
    
    weak var view: ChoseCardViewProtocol!
    
    //MARK: - init
    init(view: ChoseCardViewProtocol!) {
        
        self.view = view
        
    }
    
}

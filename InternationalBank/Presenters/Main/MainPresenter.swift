//
//  MainPresenter.swift
//  InternationalBank
//
//  Created by Ангел предохранитель on 23.06.2024.
//

import UIKit

protocol MainPresenterProtocol: AnyObject {
    
    //TODO: Функции для презентора основонго
    
}

final class MainPresenter: MainPresenterProtocol {
    
    weak var view: MainViewProtocol!
    
    //MARK: inti
    init(view: MainViewProtocol) {
        self.view = view
        
    }
}

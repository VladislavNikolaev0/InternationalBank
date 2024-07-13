//
//  CardPresenter.swift
//  InternationalBank
//
//  Created by Ангел предохранитель on 22.06.2024.
//

import UIKit

protocol CardPresenterProtocol: AnyObject {
    
    func loadCard()
    
    func tappedCard()
    
    func buttonTapped()
    
    func addGestureRecognized(cardCell: CardCell)
    
    func cardCellTapped()
    
}

final class CardPresenter: CardPresenterProtocol {
    
    weak var view: CardViewProtocol!
    
    //MARK: - init
    init(view: CardViewProtocol) {
        
        self.view = view
        
    }
    
    func loadCard() {
        
        //TODO: загрузка карт и обновление..?
        view.updateCards()
        
    }
    
    func tappedCard() {
        
        //TODO: реализации при нажатии на карту
        
    }
    
    func buttonTapped() {
        
        view.navigateToAddCardController()

    }
    
    func addGestureRecognized(cardCell: CardCell) {
        
        let cardCellTap = UITapGestureRecognizer(target: self, action: #selector(cardCellTapped))
        
        cardCell.addGestureRecognizer(cardCellTap)
        
    }
    
    @objc func cardCellTapped() {
        
        view.navigateToChoseCardController()
        
    }
}

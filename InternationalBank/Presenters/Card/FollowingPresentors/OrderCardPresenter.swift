//
//  OrderCardPresenter.swift
//  InternationalBank
//
//  Created by Ангел предохранитель on 01.07.2024.
//

import UIKit

protocol OrderCardPresenterProtocol: AnyObject {
    
    func addGestureRecognized(standartStack: UIStackView, 
                              proStack: UIStackView,
                              metalStack: UIStackView)
    
    func stackTapped()
    
}

final class OrderCardPresenter: OrderCardPresenterProtocol {
    
    weak var view: OrderCardViewProtocol!
    
    //MARK: - init
    init(view: OrderCardViewProtocol!) {
        
        self.view = view
        
    }
    
    func addGestureRecognized(standartStack: UIStackView, 
                              proStack: UIStackView,
                              metalStack: UIStackView) {
        
        let standartTap = UITapGestureRecognizer(target: self, action: #selector(stackTapped))
        let proTap = UITapGestureRecognizer(target: self, action: #selector(stackTapped))
        let metalTap = UITapGestureRecognizer(target: self, action: #selector(stackTapped))
        
        standartStack.addGestureRecognizer(standartTap)
        proStack.addGestureRecognizer(proTap)
        metalStack.addGestureRecognizer(metalTap)
        
    }
    
    @objc func stackTapped() {
        
        view.navigateToDeliveryController()
        
    }
}

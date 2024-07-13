//
//  DeliveryFinalContoller.swift
//  InternationalBank
//
//  Created by Ангел предохранитель on 16.06.2024.
//

import UIKit

final class DeliveryFinalContoller: OfficeBaseController {
    
    //MARK: - viewDidLoad
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        mainLable.text = Resources.Strings.Card.delivery
        desription.text = Resources.Strings.Card.deliveryDescription
        
        tabBarController?.tabBar.isHidden = true
        navigationItem.hidesBackButton = true
        
    }
}

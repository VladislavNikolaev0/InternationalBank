//
//  ImportCardFinalController.swift
//  InternationalBank
//
//  Created by Ангел предохранитель on 29.05.2024.
//

import UIKit

final class ImportCardFinalController: OfficeBaseController {
    
    //MARK: - viewDidload
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        mainLable.text = Resources.Strings.Card.succesfully
        desription.text = Resources.Strings.Card.succesfullyDiscription
        
        tabBarController?.tabBar.isHidden = true
        navigationItem.hidesBackButton = true
        
    }
    
}



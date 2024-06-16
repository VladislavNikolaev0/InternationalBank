//
//  NavBarController.swift
//  InternationalBank
//
//  Created by Ангел предохранитель on 16.05.2024.
//

import UIKit

class NavBarController: UINavigationController {
    
    //MARK: viewDidLoad
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configure()
    }
    
    //MARK: Configure
    private func configure() {
        navigationBar.isTranslucent = true
        navigationBar.standardAppearance.titleTextAttributes = [
            .foregroundColor: UIColor(.black),
            .font: Resources.Fonts.helveticaRegulag(size: 20)
        ]
    }
}

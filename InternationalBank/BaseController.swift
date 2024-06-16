//
//  BaseController.swift
//  InternationalBank
//
//  Created by Ангел предохранитель on 16.05.2024.
//

import UIKit

enum NavBarPosion {
    case left
    case right
}

class BaseController: UIViewController {
    
    //MARK: viewDidLoad
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupViews()
        setupConstraints()
        configureApperiens()
    }
}

//MARK: objc ext
@objc extension BaseController {
    
    func setupViews() {}
    
    func setupConstraints() {}
    
    func configureApperiens() {
        view.backgroundColor = Resources.Colors.background
    }
    
    func leftButtonTapped() {
        print("left tapped")
    }
    
    func rightButtonTapped() {}
}

//MARK: ext
extension BaseController {
    
    func addNavBarButton(position: NavBarPosion, icon: UIImage) {
        
        let button = UIButton()
        button.setImage(icon, for: .normal)
        button.makeSystem(button)
        
        switch position {
        case .left:
            button.addTarget(self,
                             action: #selector(leftButtonTapped),
                             for: .touchUpInside)
            navigationItem.leftBarButtonItem = UIBarButtonItem(customView: button)
        case .right:
            button.addTarget(self,
                             action: #selector(rightButtonTapped),
                             for: .touchUpInside)
            navigationItem.rightBarButtonItem = UIBarButtonItem(customView: button)
        }
    }
}

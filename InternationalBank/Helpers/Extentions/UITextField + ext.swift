//
//  UITextField + ext.swift
//  InternationalBank
//
//  Created by Ангел предохранитель on 27.05.2024.
//

import UIKit

extension UITextField {
    
    // ext for left padding 
    
    func setLeftPadding(points: CGFloat) {
        let paddingView = UIView(frame: CGRect(x: 0, y: 0, width: points, height: self.frame.height))
        self.leftView = paddingView
        self.leftViewMode = .always
    }
    
    
}

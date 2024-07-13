//
//  UIVIew + ext.swift
//  InternationalBank
//
//  Created by Ангел предохранитель on 17.05.2024.
//

import UIKit

extension UIView {
    
    
    //set gradient
    func applyGradient(colorArray: [UIColor], cornerRadius: CGFloat) {
        
        layer.sublayers?.filter({ $0 is CAGradientLayer }).forEach({ $0.removeFromSuperlayer() })
        
        let gradientLayer = CAGradientLayer()
        gradientLayer.colors = colorArray.map({ $0.cgColor })
        
        gradientLayer.startPoint = CGPoint(x: 0.0, y: 0.5)
        gradientLayer.endPoint = CGPoint(x: 1.0, y: 0.5)
        
        self.layoutIfNeeded()
        
        backgroundColor = .clear
        gradientLayer.frame = bounds
        gradientLayer.cornerRadius = cornerRadius
        
        layer.insertSublayer(gradientLayer, at: 0)
        
    }
    
    //for make like system button to touch
    func makeSystem(_ button: UIButton) {
        
        button.addTarget(self,
                         action: #selector(handleIn),
                         for: [
                            .touchDown,
                            .touchDragInside
                         ])
        
        button.addTarget(self,
                         action: #selector(handleOut),
                         for: [
                            .touchDragOutside,
                            .touchUpInside,
                            .touchUpOutside,
                            .touchDragExit,
                            .touchCancel
                         ])
        
    }
    
    func addSeparator(padding: CGFloat, infinite: Bool) {
        
        let separator: UIView = {
            let view = UIView()
            view.backgroundColor = Resources.Colors.separator
            view.translatesAutoresizingMaskIntoConstraints = false
            return view
        }()
        
        addSubview(separator)
        
        if infinite {
            
            NSLayoutConstraint.activate([
                
                separator.topAnchor.constraint(equalTo: self.bottomAnchor, constant: padding),
                separator.leadingAnchor.constraint(equalTo: self.superview!.leadingAnchor),
                separator.trailingAnchor.constraint(equalTo: self.superview!.trailingAnchor),
                separator.heightAnchor.constraint(equalToConstant: 1),
                
            ])
            
        } else {
            
            NSLayoutConstraint.activate([
                
                separator.topAnchor.constraint(equalTo: self.bottomAnchor, constant: padding),
                separator.leadingAnchor.constraint(equalTo: self.leadingAnchor),
                separator.trailingAnchor.constraint(equalTo: self.trailingAnchor),
                separator.heightAnchor.constraint(equalToConstant: 1),
                
            ])
            
        }
        
    }
    
    @objc func handleIn() {
        
        UIView.animate(withDuration: 0.15) { self.alpha = 0.55 }
        
    }
    
    @objc func handleOut() {
        
        UIView.animate(withDuration: 0.15) { self.alpha = 1 }
        
    }
    
}

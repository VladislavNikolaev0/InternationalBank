//
//  UITextField + ext.swift
//  InternationalBank
//
//  Created by Ангел предохранитель on 27.05.2024.
//

import UIKit

extension UITextField {
    
    
    // func for left padding
    func setLeftPadding(points: CGFloat) {
        
        let paddingView = UIView(frame: CGRect(x: 0, y: 0, width: points, height: self.frame.height))
        
        self.leftView = paddingView
        self.leftViewMode = .always
        
    }
    
    //funcs for auto scrolling in the center frame
    func enableAutoScroll(in scrollView: UIScrollView) {
        
        self.addTarget(self, action: #selector(self.textFieldDidBeginEditing), for: .editingDidBegin)
        self.addTarget(self, action: #selector(self.textFieldDidEndEditing), for: .editingDidEnd)
        
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow(notification:)), name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillHide(notification:)), name: UIResponder.keyboardWillHideNotification, object: nil)
        
    }
    
    @objc private func textFieldDidBeginEditing() {
        
        guard let scrollView = superviewOfType(UIScrollView.self) else { return }
        
        let yOffset = self.frame.origin.y - (scrollView.frame.size.height / 2) + (self.frame.size.height / 2)
        
        scrollView.setContentOffset(CGPoint(x: 0, y: yOffset), animated: true)
        
    }
    
    @objc private func textFieldDidEndEditing() {
        
        guard let scrollView = superviewOfType(UIScrollView.self) else { return }
        
        scrollView.setContentOffset(CGPoint.zero, animated: true)
        
    }
    
    @objc private func keyboardWillShow(notification: NSNotification) {
        
        guard let scrollView = superviewOfType(UIScrollView.self) else { return }
        
        if let keyboardSize = (notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue)?.cgRectValue {
            
            let contentInsets = UIEdgeInsets(top: 0.0, left: 0.0, bottom: keyboardSize.height, right: 0.0)
            
            scrollView.contentInset = contentInsets
            scrollView.scrollIndicatorInsets = contentInsets
            
        }
        
    }
    
    @objc private func keyboardWillHide(notification: NSNotification) {
        
        guard let scrollView = superviewOfType(UIScrollView.self) else { return }
        
        let contentInsets = UIEdgeInsets.zero
        
        scrollView.contentInset = contentInsets
        scrollView.scrollIndicatorInsets = contentInsets
        
    }
    
    func superviewOfType<T>(_ type: T.Type) -> T? {
        
        var view = self.superview
        
        while view != nil {
            
            if let typedView = view as? T {
                
                return typedView
                
            }
            
            view = view?.superview
            
        }
        
        return nil
        
    }
    
}

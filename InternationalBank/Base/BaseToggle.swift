//
//  BaseToggle.swift
//  InternationalBank
//
//  Created by Ангел предохранитель on 06.07.2024.
//

import UIKit

final class BaseToggle: UIControl {
    
    private let backgroundView: UIView = {
        let view = UIView()
        view.backgroundColor = Resources.Colors.separator
        return view
    }()
    
    private let toggleView: UIView = {
        let view = UIView()
        view.backgroundColor = .white
        return view
    }()
    
    private var isOn: Bool
    
    private var toggleKey: String
    
    private var offLeadingConstraint: NSLayoutConstraint!
    private var onLeadingConstraint: NSLayoutConstraint!
    
    private let storage: StorageManagerProtocol = StorageManager()
    
    //MARK: - init
    init(frame: CGRect, isOn: Bool = false, key: String) {
        
        self.toggleKey = key
        self.isOn = storage.bool(key: key) ?? isOn
        
        super.init(frame: frame)
        
        setupViews()
        setupConstraints()
        configureApperiens()
        
        addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(toggleTapped)))
        
        updateTogglePosition()
        
    }
    
    required init?(coder: NSCoder) {
        
        fatalError("init(coder:) has not been implemented")
        
    }
    
    @objc private func toggleTapped() {
        
        isOn.toggle()
        
        storage.set(object: isOn, key: toggleKey)
        
        updateTogglePosition()
        
        sendActions(for: .valueChanged)
        
    }
    
    private func updateTogglePosition() {
        
        UIView.animate(withDuration: 0.3) {
            
            self.offLeadingConstraint.isActive = !self.isOn
            self.onLeadingConstraint.isActive = self.isOn
            self.backgroundView.backgroundColor = self.isOn ? Resources.Gradients.Standart.start : Resources.Colors.separator
            
            self.layoutIfNeeded()
            
        }
    
    }
    
}

//MARK: - ext
extension BaseToggle {
    
    func setupViews() {
        
        addSubview(backgroundView)
        addSubview(toggleView)
        
    }
    
    func setupConstraints() {
        
        backgroundView.translatesAutoresizingMaskIntoConstraints = false
        toggleView.translatesAutoresizingMaskIntoConstraints = false
        
        offLeadingConstraint = toggleView.leadingAnchor.constraint(equalTo: backgroundView.leadingAnchor, constant: 2)
        onLeadingConstraint = toggleView.leadingAnchor.constraint(equalTo: backgroundView.trailingAnchor, constant: -self.frame.height + 1)
        
        NSLayoutConstraint.activate([
            
            backgroundView.topAnchor.constraint(equalTo: topAnchor),
            backgroundView.leadingAnchor.constraint(equalTo: leadingAnchor),
            backgroundView.trailingAnchor.constraint(equalTo: trailingAnchor),
            backgroundView.bottomAnchor.constraint(equalTo: bottomAnchor),
            
            toggleView.heightAnchor.constraint(equalToConstant: self.frame.height - 2),
            toggleView.widthAnchor.constraint(equalToConstant: self.frame.height - 2),
            offLeadingConstraint,
            toggleView.centerYAnchor.constraint(equalTo: backgroundView.centerYAnchor)
            
        ])
        
        updateTogglePosition()
        
    }
    
    func configureApperiens() {
        
        backgroundView.layer.cornerRadius = self.frame.height / 2
        
        toggleView.layer.cornerRadius = self.frame.height / 2
    
    }
    
}

//
//  EyeView.swift
//  InternationalBank
//
//  Created by Ангел предохранитель on 08.07.2024.
//

import UIKit

final class EyeView: BaseView {
    
    private var open: Bool = true
    
    private let eyeballView: UIView = {
        let view = UIView()
        view.backgroundColor = .white
        view.bounds.size = CGSize(width: 22, height: 15)
        view.layer.cornerRadius = view.frame.width / 2
        return view
    }()
    
    private let eyePupilView: UIView = {
        let view = UIView()
        view.backgroundColor = .white
        view.bounds.size = CGSize(width: 5, height: 5)
        view.layer.cornerRadius = view.frame.height / 2
        return view
    }()
    
    private let eyeShapeLayer: CAShapeLayer = {
        let layer = CAShapeLayer()
        layer.strokeColor = UIColor.white.cgColor
        layer.fillColor = UIColor.clear.cgColor
        layer.lineWidth = 2
        return layer
    }()
    
    //MARK: - init
    init(open: Bool) {
        
        super.init(frame: .zero)
        
        self.open = open
        
        
        setupViews()
        setupConstraints()
        configureApperiense()
        
    }
    
    required init?(coder: NSCoder) {
        
        super.init(coder: coder)
        
        setupViews()
        setupConstraints()
        configureApperiense()
        
    }
    
    //MARK: - layoutSubviwes
    override func layoutSubviews() {
        
        super.layoutSubviews()
        
        holeInEyeball()
        
        eyeShapeLayer.frame = eyeballView.bounds
        eyeShapeLayer.path = open ? eyeOpenPath() : eyeClosedPath()
        
    }
    
    private func holeInEyeball() {
        
        let layer = CAShapeLayer()
        
        let path = UIBezierPath(rect: eyeballView.bounds)
        
        let holePath = UIBezierPath(ovalIn: CGRect(
            x: eyeballView.bounds.midX - 5,
            y: eyeballView.bounds.midY - 5,
            width: 10,
            height: 10))
        
        path.append(holePath.reversing())
        layer.path = path.cgPath
        
        eyeballView.layer.mask = layer
        
    }
    
    private func eyeOpenPath() -> CGPath {
        
        let path = UIBezierPath()
        
        path.move(to: CGPoint(x: 0, y: eyeballView.bounds.midY))
        path.addQuadCurve(to: CGPoint(x: eyeballView.bounds.width, y: eyeballView.bounds.midY),
                          controlPoint: CGPoint(x: eyeballView.bounds.width / 2, y: -eyeballView.bounds.height / 2))
        
        return path.cgPath
        
    }
    
    private func eyeClosedPath() -> CGPath {
        
        let path = UIBezierPath()
        
        path.move(to: CGPoint(x: 0, y: eyeballView.bounds.midY))
        path.addQuadCurve(to: CGPoint(x: eyeballView.bounds.width, y: eyeballView.bounds.midY),
                          controlPoint: CGPoint(x: eyeballView.bounds.width / 2, y: eyeballView.bounds.height * 1.5))
        
        return path.cgPath
        
    }
    
    @objc func toggleEye() {
        
        open.toggle()
        
        let animation = CABasicAnimation(keyPath: "path")
        
        animation.fromValue = open ? eyeClosedPath() : eyeOpenPath()
        animation.toValue = open ? eyeOpenPath() : eyeClosedPath()
        animation.duration = 0.3
        animation.timingFunction = CAMediaTimingFunction(name: .easeInEaseOut)
        
        eyeShapeLayer.path = open ? eyeOpenPath() : eyeClosedPath()
        eyeShapeLayer.add(animation, forKey: "path")
        
        UIView.transition(with: eyeballView, duration: 0.3, options: .transitionFlipFromBottom, animations: {
            
            UIView.animate(withDuration: 0.3) {
                
                self.eyePupilView.alpha = self.open ? 1.0 : 0.0
                self.eyeballView.alpha = self.open ? 1.0 : 0.0
                
            }
            
        }, completion: nil)
        
    }
    
    func addPupilToSuperview() {
        
        guard let superview = superview else { return }
        
        superview.addSubview(eyePupilView)
        
        eyePupilView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            
            eyePupilView.centerXAnchor.constraint(equalTo: eyeballView.centerXAnchor),
            eyePupilView.centerYAnchor.constraint(equalTo: eyeballView.centerYAnchor),
            eyePupilView.heightAnchor.constraint(equalToConstant: 5),
            eyePupilView.widthAnchor.constraint(equalToConstant: 5),
            
        ])
        
    }
}

//MARK: - ext
extension EyeView {
    
    override func setupViews() {
        
        super.setupViews()
        
        addSubview(eyeballView)
        layer.addSublayer(eyeShapeLayer)

    }
    
    override func setupConstraints() {
        
        super.setupConstraints()
        
        eyeballView.translatesAutoresizingMaskIntoConstraints = false

        NSLayoutConstraint.activate([
            
            eyeballView.topAnchor.constraint(equalTo: topAnchor),
            eyeballView.leadingAnchor.constraint(equalTo: leadingAnchor),
            eyeballView.trailingAnchor.constraint(equalTo: trailingAnchor),
            eyeballView.bottomAnchor.constraint(equalTo: bottomAnchor),
            eyeballView.heightAnchor.constraint(equalToConstant: 22),
            eyeballView.widthAnchor.constraint(equalToConstant: 15),
            
        ])
    }
    
    override func configureApperiense() {
        
        super.configureApperiense()
        
        layoutIfNeeded()
        
    }
    
}

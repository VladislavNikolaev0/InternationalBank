//
//  OfficeBaseController.swift
//  InternationalBank
//
//  Created by Ангел предохранитель on 16.06.2024.
//

import UIKit

class OfficeBaseController: BaseController {
    
    let mainLable: UILabel = {
        let lable = UILabel()
        lable.font = Resources.Fonts.helveticaBold(size: 32)
        lable.textColor = Resources.Gradients.Standart.end
        lable.textAlignment = .center
        return lable
    }()
    
    var roolUp = false
    
    let desription: UILabel = {
        let lable = UILabel()
        lable.font = Resources.Fonts.helveticaItalic(size: 16)
        lable.textColor = Resources.Gradients.Standart.end
        lable.textAlignment = .center
        lable.numberOfLines = 0
        return lable
    }()
    
    let officeImage: UIImageView = {
        let image = UIImageView()
        image.image = Resources.Image.Common.office
        image.contentMode = .scaleAspectFit
        return image
    }()
    
    //MARK: - viewDidLoad
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        tabBarController?.tabBar.isHidden = true
        navigationItem.hidesBackButton = true
        
        setupViews()
        setupConstraints()
        configureApperiens()
        
        if roolUp {
            
            DispatchQueue.main.asyncAfter(deadline: .now() + 3.0) {
                
                self.navigationController?.popToRootViewController(animated: true)
                
            }
            
        }
        
    }
    
    //MARK: - init
    init(roolUp: Bool = false) {
        
        self.roolUp = roolUp
        
        super.init(nibName: nil, bundle: nil)
        
    }
    
    required init?(coder: NSCoder) {
        
        super.init(coder: coder)
        
    }
    
}


//MARK: - ext
extension OfficeBaseController {
    
    override func setupViews() {
        
        super.setupViews()
        
        view.addSubview(mainLable)
        view.addSubview(desription)
        view.addSubview(officeImage)
        
    }
    
    override func setupConstraints() {
        
        super.setupConstraints()
        
        mainLable.translatesAutoresizingMaskIntoConstraints = false
        desription.translatesAutoresizingMaskIntoConstraints = false
        officeImage.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            
            mainLable.topAnchor.constraint(equalTo: view.topAnchor, constant: 80),
            mainLable.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 79),
            mainLable.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -79),
            
            desription.topAnchor.constraint(equalTo: mainLable.bottomAnchor, constant: 33),
            desription.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 58),
            desription.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -58),
            
            officeImage.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            
        ])
        
    }
    
    override func configureApperiens() {
        
        super.configureApperiens()
        
        view.backgroundColor = .white
        
    }
}

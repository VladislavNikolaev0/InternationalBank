//
//  TabbarController.swift
//  InternationalBank
//
//  Created by Ангел предохранитель on 14.05.2024.
//

import UIKit

// MARK: - enum Tabs
enum Tabs: Int {
    
    case cards
    case transaction
    case main
    case transfers
    case mail
    
}

// MARK: - TabBar
final class TabbarController: UITabBarController, UITabBarControllerDelegate {
    
    private var selectionIndicator: UIView = {
        let view = UIView()
        view.backgroundColor = Resources.Gradients.Standart.start.withAlphaComponent(0.06)
        view.bounds.size = CGSize(width: 47, height: 47)
        view.layer.cornerRadius = view.bounds.width / 2
        view.isUserInteractionEnabled = false
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
        
        configure()
        
    }
    
    required init?(coder: NSCoder) {
        
        fatalError("init(coder:) has not been implemented")
        
    }
    
    // MARK: - func configure
    private func configure() {
        
        tabBar.backgroundColor = .white
        delegate = self
        tabBar.layer.masksToBounds = true
        
        let cardController = CardController(presenter: nil)
        let cardPresenter = CardPresenter(view: cardController)
        cardController.presenter = cardPresenter
       
        let transactionController = TransactionController(presenter: nil)
        let transactionPresenter = TransactionPresenter(view: transactionController)
        transactionController.presenter = transactionPresenter
        
        let mainController = MainController(presenter: nil)
        let mainPresenter = MainPresenter(view: mainController)
        mainController.presenter = mainPresenter
        
        let transfersController = TransfersController(presenter: nil)
        let transfersPresenter = TransfersPresenter(view: transfersController)
        transfersController.presenter = transfersPresenter
        
        let mailController = MailController(presenter: nil)
        let mailPresenter = MailPresenter(view: mailController)
        mailController.presenter = mailPresenter
        
        let cardNavigation = NavBarController(rootViewController: cardController)
        let transactionNavigation = NavBarController(rootViewController: transactionController)
        let mainNavigation = NavBarController(rootViewController: mainController)
        let transfersNavigation = NavBarController(rootViewController: transfersController)
        let mailNavigation = NavBarController(rootViewController: mailController)
        
        cardNavigation.tabBarItem = UITabBarItem(title: nil,
                                                 image: Resources.Image.Card.tabImage?.withRenderingMode(.alwaysOriginal),
                                                 tag: Tabs.cards.rawValue)
        cardNavigation.tabBarItem.imageInsets = UIEdgeInsets(top: 12, left: 0, bottom: -6, right: 0)
        
        transactionNavigation.tabBarItem = UITabBarItem(title: nil,
                                                        image: Resources.Image.Transaction.tabImage?.withRenderingMode(.alwaysOriginal),
                                                        tag: Tabs.transaction.rawValue)
        transactionNavigation.tabBarItem.imageInsets = UIEdgeInsets(top: 6, left: 0, bottom: -6, right: 0)
        
        mainNavigation.tabBarItem = UITabBarItem(title: nil,
                                                 image: Resources.Image.Main.tabImage?.withRenderingMode(.alwaysOriginal),
                                                 tag: Tabs.main.rawValue)
        mainNavigation.tabBarItem.imageInsets = UIEdgeInsets(top: 12, left: 0, bottom: -6, right: 0)
        
        transfersNavigation.tabBarItem = UITabBarItem(title: nil,
                                                      image: Resources.Image.Transfers.tabImage?.withRenderingMode(.alwaysOriginal),
                                                      tag: Tabs.transfers.rawValue)
        transfersNavigation.tabBarItem.imageInsets = UIEdgeInsets(top: 12, left: 0, bottom: -6, right: 0)
        
        mailNavigation.tabBarItem = UITabBarItem(title: nil,
                                                 image: Resources.Image.Mail.tabImage?.withRenderingMode(.alwaysOriginal),
                                                 tag: Tabs.mail.rawValue)
        mailNavigation.tabBarItem.imageInsets = UIEdgeInsets(top: 12, left: 0, bottom: -6, right: 0)
        
        setViewControllers([
            cardNavigation,
            transactionNavigation,
            mainNavigation,
            transfersNavigation,
            mailNavigation,
        ], animated: false)
        
        setupSelector()
        
    }
    
    
    // MARK: - Selector - circle
    private func updateSelector(animated: Bool) {
        
        guard let tabBarItems = tabBar.items else { return }
        
        var tabBarButtons: [UIView] = []
        
        for item in tabBarItems {
            
            if let view = item.value(forKey: "view") as? UIView  {
                
                tabBarButtons.append(view)
                
            }
            
        }
        
        let selectedIndex = self.selectedIndex
        let selectedButton = tabBarButtons[selectedIndex]
        var center = selectedButton.center
        
        center.y += 2
        
        if tabBarButtons[2] == selectedButton {
            
            selectionIndicator.bounds.size = CGSize(width: 53, height: 53)
            
        } else {
            
            selectionIndicator.bounds.size = CGSize(width: 47, height: 47)
            
        }
        
        if animated {
            
            UIView.animate(withDuration: 0.3) {
                
                self.selectionIndicator.center = center
                
            }
            
        } else {
            
            self.selectionIndicator.center = center
            
        }
        
    }
    
    private func setupSelector() {

        let center = CGPoint(x: 37, y: 27)
        
        
        tabBar.addSubview(selectionIndicator)
        tabBar.sendSubviewToBack(selectionIndicator)
        
        self.selectionIndicator.center = center
        
    }
    
    func tabBarController(_ tabBarController: UITabBarController, didSelect viewController: UIViewController) {
        
        updateSelector(animated: true)
        
    }
    
}

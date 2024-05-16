//
//  TabbarController.swift
//  InternationalBank
//
//  Created by Ангел предохранитель on 14.05.2024.
//

import UIKit

// MARK: enum Tabs
enum Tabs: Int {
    case cards
    case transaction
    case main
    case transfers
    case mail
}

// MARK: TabBar
final class TabbarController: UITabBarController, UITabBarControllerDelegate {
    
    private var selectionIndicator: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor.orange.withAlphaComponent(0.1)
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
    
    // MARK: func configure
    private func configure() {
        tabBar.backgroundColor = .white
        delegate = self
        tabBar.layer.masksToBounds = true
        
                
        let cardController = UIViewController()
           let transactionController = UIViewController()
           let mainController = UIViewController()
           let transfersController = UIViewController()
           let mailController = UIViewController()
           
           let cardNavigation = UINavigationController(rootViewController: cardController)
           let transactionNavigation = UINavigationController(rootViewController: transactionController)
           let mainNavigation = UINavigationController(rootViewController: mainController)
           let transfersNavigation = UINavigationController(rootViewController: transfersController)
           let mailNavigation = UINavigationController(rootViewController: mailController)
           
        cardController.tabBarItem = UITabBarItem(title: nil,
                                                 image: Resources.Image.Card.tabImage?.withRenderingMode(.alwaysOriginal),
                                                 tag: Tabs.cards.rawValue)
        cardController.tabBarItem.imageInsets = UIEdgeInsets(top: 12, left: 0, bottom: -6, right: 0)
        
        transactionController.tabBarItem = UITabBarItem(title: nil,
                                                        image: Resources.Image.Transaction.tabImage?.withRenderingMode(.alwaysOriginal),
                                                        tag: Tabs.transaction.rawValue)
        transactionController.tabBarItem.imageInsets = UIEdgeInsets(top: 6, left: 0, bottom: -6, right: 0)
        
        mainController.tabBarItem = UITabBarItem(title: nil,
                                                 image: Resources.Image.Main.tabImage?.withRenderingMode(.alwaysOriginal),
                                                 tag: Tabs.main.rawValue)
        mainController.tabBarItem.imageInsets = UIEdgeInsets(top: 12, left: 0, bottom: -6, right: 0)
        
        transfersController.tabBarItem = UITabBarItem(title: nil,
                                                      image: Resources.Image.Transfers.tabImage?.withRenderingMode(.alwaysOriginal),
                                                      tag: Tabs.transfers.rawValue)
        transfersController.tabBarItem.imageInsets = UIEdgeInsets(top: 12, left: 0, bottom: -6, right: 0)
        
        mailController.tabBarItem = UITabBarItem(title: nil,
                                                 image: Resources.Image.Mail.tabImage?.withRenderingMode(.alwaysOriginal),
                                                 tag: Tabs.mail.rawValue)
        mailController.tabBarItem.imageInsets = UIEdgeInsets(top: 12, left: 0, bottom: -6, right: 0)
        
        
        setViewControllers([
            cardController,
            transactionController,
            mainController,
            transfersController,
            mailController
        ], animated: false)
        
        setupSelector()
        
    }
    
    
    // MARK: Selector - circle
    private func updateSelector(animated: Bool) {
        
        let selectedIndex = self.selectedIndex
        guard tabBar.items != nil else { return }
        
        let tabBarButtons = tabBar.subviews.filter { $0 is UIControl }
        let selectedButton = tabBarButtons[selectedIndex]
        print(selectedIndex)
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

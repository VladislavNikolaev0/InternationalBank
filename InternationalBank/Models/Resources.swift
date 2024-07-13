//
//  Resources.swift
//  InternationalBank
//
//  Created by Ангел предохранитель on 14.05.2024.
//

import UIKit

enum Resources {
    
    // MARK: Images
    enum Image {
        
        enum Card {
            
            static let tabImage = UIImage(named: "tabCard")
            
        }
        
        enum Transaction {
            
            static let tabImage = UIImage(named: "tabTransaction")
            
        }
        
        enum Main {
            
            static let tabImage = UIImage(named: "tabLogotype")
            
        }
        
        enum Transfers {
            
            static let tabImage = UIImage(named: "tabTransfer")
            
        }
        
        enum Mail {
            
            static let tabImage = UIImage(named: "tabMail")
            
        }
        
        enum Common {
            
            static let euroExchange = UIImage(named: "euroExchange")
            
            static let background = UIImage(named: "background")
            
            static let arrowNavBar = UIImage(named: "arrowNavBar")
            static let settingsGear = UIImage(named: "settings")
            
            static let office = UIImage(named: "office")
            
        }
        
    }
    
    //MARK: Colors
    enum Colors {
        
        static let background = UIColor(hexString: "#F3F6FA")
        
        static let titleGray = UIColor(hexString: "#9C9C9C")
        
        static let borderColor = UIColor(hexString: "#CDCEDC")
        
        static let separator = UIColor(hexString: "#E0E2E6")
    }
    
    //MARK: Fonts
    enum Fonts {
        
        static func helveticaRegulag(size: CGFloat) -> UIFont {
            
            return UIFont(name: "Helvetica", size: size) ?? UIFont()
            
        }
        
        static func helveticaBold(size: CGFloat) -> UIFont {
            
            return UIFont(name: "Helvetica-Bold", size: size) ?? UIFont()
            
        }
        
        static func helveticaItalic(size: CGFloat) -> UIFont {
            
            return UIFont(name: "Helvetica-Oblique", size: size) ?? UIFont()
            
        }
    }
    
    //MARK: Strings
    enum Strings {
        
        enum Card {
            
            static let cards = "Cards"
            static let standartNumber = "5555 ****"
            
            static let business = "Business"
            static let virtual = "Virtual"
            static let personal = "Personal"
            static let business2 = "Business#2"
            
            static let activateCard = "Activate card:"
            static let onlineShoping = "Online Shoping:"
            static let digitalCard = "Digital Card (Auto Apple Pay):"
            static let limits = "Limits:"
            static let dayLimit = "2,850$"
            static let monthLimit = "198,523$"
            static let day = "Day"
            static let month = "Month"
            static let changePin = "Change PIN"
            static let changeCard = "Change Card"
            static let applePay = "Pay"
            static let numberCardExample = "5545 6754 2204 8049"
            static let cvvCardExample = "876"
            
            static let addNew = "+ Add new"
            static let orderANewCard = "Order a new card"
            static let importCard = "Import card"
            
            static let nameSurname = "Name Surname"
            static let cardDate = "11/22"
            static let importCardTitle = "Add new card"
            static let walletXYZ = "Wallet XYZ"
            static let secureCardNumber = "**** **** **** ****"
            static let cardName = "Card Name"
            static let cardNumber = "Card Number"
            static let cvv = "CVV"
            static let save = "Save"
            
            static let succesfully = "Succesfully"
            static let succesfullyDiscription = "Your Card has been successfully\nimported"
            
            static let orderNewCard = "Order a new card"
            static let standart = "Standart"
            static let pro = "Pro"
            static let metal = "Metal"
            
            static let deliveryAddress = "Delivery address"
            static let country = "Country"
            static let uS = "United States"
            static let address = "Address"
            static let addressExample = "Nowhere Strees 98L"
            static let code = "Code"
            static let codeExample = "CA - 10058"
            static let city = "City"
            static let cityExample = "New Vegas"
            
            static let delivery = "Delivery"
            static let deliveryDescription = "You new card will be that address ***\non Nowember 7th."
            
        }
        
    }
    
    //MARK: Gradients
    enum Gradients {

        enum Standart {
            
            static let start = UIColor(hexString: "#222657")
            static let end = UIColor(hexString: "#5A5ED6")
            
        }
        
        enum Pro {
            
            static let start = UIColor(hexString: "#DB6060")
            static let end = UIColor(hexString: "#E8A95F")
            
        }
        
        enum Metal {
            
            static let start = UIColor(hexString: "#520B99")
            static let end = UIColor(hexString: "#D14879")
            
        }
        
        enum Custom {
            
            static let start = UIColor(hexString: "#2E3CEB")
            static let end = UIColor(hexString: "#31BDEA")
            
        }
        
    }
    
}

//
//  StorageManager.swift
//  InternationalBank
//
//  Created by Ангел предохранитель on 12.07.2024.
//

import UIKit

protocol StorageManagerProtocol {
    
    func set(_ object: Any?, key: String)
    
    func set<T: Encodable>(object: T?, key: String)

    func int(key: String) -> Int?
    
    func string(key: String) -> String?
    
    func dict(key: String) -> [String: Any]?
    
    func date(key: String) -> Date?
    
    func bool(key: String) -> Bool?
    
    func data(key: String) -> Data?
    
    func codableData<T: Decodable>(key: String) -> T?
    
    func storeBool(_ value: Bool, key: String)
}

final class StorageManager {
    
    private let userDefaults = UserDefaults.standard
    
    private func store(_ object: Any?, key: String) {
        
        DispatchQueue.global(qos: .userInteractive).async {
            
            self.userDefaults.set(object, forKey: key)
            
        }
        
    }
    
    private func restore(key: String) -> Any? {
        
        userDefaults.object(forKey: key)
        
    }
    
    
}

// MARK: - StorageManagerProtocol
extension StorageManager: StorageManagerProtocol {
    
    func storeBool(_ value: Bool, key: String) {
        
        userDefaults.set(value, forKey: key)
        
    }
    
    func restoreBool(key: String) -> Bool? {
        
        return userDefaults.bool(forKey: key)
        
    }
    
    func set(_ object: Any?, key: String) {
        
        store(object, key: key)
        
    }

    func set<T: Encodable>(object: T?, key: String) {
        
        let jsonData = try? JSONEncoder().encode(object)
        
        store(jsonData, key: key)
        
    }

    func int(key: String) -> Int? {
        
        restore(key: key) as? Int
        
    }

    func string(key: String) -> String? {
        
        restore(key: key) as? String
        
    }

    func dict(key: String) -> [String : Any]? {
        
        restore(key: key) as?  [String : Any]
        
    }

    func date(key: String) -> Date? {
        
        restore(key: key) as? Date
        
    }

    func bool(key: String) -> Bool? {
        
        restore(key: key) as? Bool
        
    }

    func data(key: String) -> Data? {
        
        restore(key: key) as? Data
        
    }

    func codableData<T: Decodable>(key: String) -> T? {
        
        guard let data = restore(key: key) as? Data else { return nil }
        
        return try? JSONDecoder().decode(T.self, from: data)
        
    }

    func remove(key: String) {
        
        userDefaults.removeObject(forKey: key)
        
    }
    
}

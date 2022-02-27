//
//  UserDefaultsManager.swift
//  AppMVVM
//
//  Created by Igor on 22.02.2022.
//

import Foundation

class UDManager {
    static let shared = UDManager()
    
    private init() {}
    
    func setData<T>(status: T, key: String) {
        UserDefaults.standard.set(status, forKey: key)
    }
    
    func getBoolData(key: String) -> Bool {
        UserDefaults.standard.bool(forKey: key)
    }
    
    func getStringData(key: String) -> String? {
        UserDefaults.standard.string(forKey: key)
    }
}

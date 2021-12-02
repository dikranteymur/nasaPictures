//
//  UserDefaultsExtension.swift
//  NasaPictures
//
//  Created by mdt on 2.12.2021.
//

import Foundation

extension UserDefaults {
    private enum Status: String {
        case filterList = "filterList"
       
        var name: String {
            get {
                return self.rawValue
            }
        }
    }
    
    class var filterList: [String] {
        get {
//            return UserDefaults.standard.array(forKey: Status.filterList.name) as! [String]
            return UserDefaults.standard.stringArray(forKey: Status.filterList.name) ?? []
            
        }
        
        set {
            UserDefaults.standard.setValue(newValue, forKey: Status.filterList.name)
        }
    }
}

//
//  UserDefaultsExtension.swift
//  NasaPictures
//
//  Created by mdt on 2.12.2021.
//

import Foundation

extension UserDefaults {
    private enum Status: String {
        case filterListForCuriosity = "filterListForCuriosity"
        case filterListForOpportunity = "filterListForOpportunity"
        case filterListForSpirit = "filterListForSpirit"
        
        var name: String {
            get {
                return self.rawValue
            }
        }
    }
    
    class var filterListForCuriosity: [String] {
        get {
            return UserDefaults.standard.stringArray(forKey: Status.filterListForCuriosity.name) ?? []
            
        }
        
        set {
            UserDefaults.standard.setValue(newValue, forKey: Status.filterListForCuriosity.name)
        }
    }
    
    class var filterListForOpportunity: [String] {
        get {
            return UserDefaults.standard.stringArray(forKey: Status.filterListForOpportunity.name) ?? []
            
        }
        
        set {
            UserDefaults.standard.setValue(newValue, forKey: Status.filterListForOpportunity.name)
        }
    }
    
    class var filterListForSpirit: [String] {
        get {
            return UserDefaults.standard.stringArray(forKey: Status.filterListForSpirit.name) ?? []
            
        }
        
        set {
            UserDefaults.standard.setValue(newValue, forKey: Status.filterListForSpirit.name)
        }
    }
}

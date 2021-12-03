//
//  MainBuilderModel.swift
//  NasaPictures
//
//  Created by mdt on 3.12.2021.
//

import Foundation

struct MainBuilderModel {
    var screenName: ScreenName
    
    func setFilterListToUserdefault(list: [String]) {
        switch screenName {
            case .Curiosity:
                UserDefaults.filterListForCuriosity = list
            case .Opportunity:
                UserDefaults.filterListForOpportunity = list
            case .Spirit:
                UserDefaults.filterListForSpirit = list
        }
    }
    
    func getFilterListFromUserdefault() -> [String] {
        switch screenName {
            case .Curiosity:
                return UserDefaults.filterListForCuriosity
            case .Opportunity:
                return UserDefaults.filterListForOpportunity
            case .Spirit:
                return UserDefaults.filterListForSpirit
        }
    }
    
    
}

enum ScreenName: String {
    case Curiosity = "Curiosity"
    case Opportunity = "Opportunity"
    case Spirit = "Spirit"
    
    var name: String {
        return self.rawValue
    }
    
}



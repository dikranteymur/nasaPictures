//
//  OpportunityBuilder.swift
//  NasaPictures
//
//  Created by mdt on 1.12.2021.
//

import UIKit

final class OpportunityBuilder {
    static func make() -> OpportunityVC {
        let storyboard = UIStoryboard(name: "OpportunityVC", bundle: nil)
        let viewController = storyboard.instantiateViewController(withIdentifier: "OpportunityVC") as! OpportunityVC
        
        return viewController
    }
}

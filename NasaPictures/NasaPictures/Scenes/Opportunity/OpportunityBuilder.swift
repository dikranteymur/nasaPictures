//
//  OpportunityBuilder.swift
//  NasaPictures
//
//  Created by mdt on 1.12.2021.
//

import UIKit

final class OpportunityBuilder {
    static func make() -> OpportunityNC {
        let storyboard = UIStoryboard(name: "OpportunityVC", bundle: Bundle.main)
        let navigationController = storyboard.instantiateViewController(withIdentifier: "OpportunityNC") as! OpportunityNC
        return navigationController
    }
}

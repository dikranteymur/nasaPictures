//
//  SpiritBuilder.swift
//  NasaPictures
//
//  Created by mdt on 1.12.2021.
//

import UIKit

final class SpiritBuilder {
    static func make() -> SpiritVC {
        let storyboard = UIStoryboard(name: "SpiritVC", bundle: nil)
        let viewController = storyboard.instantiateViewController(withIdentifier: "SpiritVC") as! SpiritVC
        
        return viewController
    }
}

//
//  SpiritBuilder.swift
//  NasaPictures
//
//  Created by mdt on 1.12.2021.
//

import UIKit

final class SpiritBuilder {
    static func make() -> SpiritNC {
        let storyboard = UIStoryboard(name: "SpiritVC", bundle: Bundle.main)
        let navigationController = storyboard.instantiateViewController(withIdentifier: "SpiritNC") as! SpiritNC
        return navigationController
    }
}

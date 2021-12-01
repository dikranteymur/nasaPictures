//
//  TabbarBuilder.swift
//  NasaPictures
//
//  Created by mdt on 1.12.2021.
//

import UIKit

final class TabbarBuilder {
    static func make() -> TabbarVC {
        let storyboard = UIStoryboard(name: "TabbarVC", bundle: nil)
        let viewController = storyboard.instantiateViewController(withIdentifier: "TabbarVC") as! TabbarVC
        
        return viewController
    }
}


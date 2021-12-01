//
//  TabbarVC.swift
//  NasaPictures
//
//  Created by mdt on 1.12.2021.
//

import UIKit

class TabbarVC: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        initVC()
        
    }
  
    private func initVC() {
        let curiosityVC = CuriosityBuilder.make()
        let curiosityItem = UITabBarItem(title: "Curiosity", image: UIImage(named: "mars1"), selectedImage: UIImage(named: "mars1"))
        curiosityVC.tabBarItem = curiosityItem
        
        let opportunityVC = OpportunityBuilder.make()
        let opportunityItem = UITabBarItem(title: "Opportunity", image: UIImage(named: "mars2"), selectedImage: UIImage(named: "mars2"))
        opportunityVC.tabBarItem = opportunityItem
        
        let spiritVC = SpiritBuilder.make()
        let spiritItem = UITabBarItem(title: "Spirit", image: UIImage(named: "mars3"), selectedImage: UIImage(named: "mars3"))
        spiritVC.tabBarItem = spiritItem
        
        viewControllers = [curiosityVC, opportunityVC, spiritVC]
    }
}

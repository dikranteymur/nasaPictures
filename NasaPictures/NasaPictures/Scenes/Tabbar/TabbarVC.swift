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
        let curiosityModel = MainBuilderModel(screenName: .Curiosity)
        let curiosityNC = CuriosityBuilder.make(model: curiosityModel)
        let curiosityItem = UITabBarItem(title: "Curiosity", image: UIImage(named: "mars1"), selectedImage: UIImage(named: "mars1"))
        curiosityNC.tabBarItem = curiosityItem
        
        let opportunityModel = MainBuilderModel(screenName: .Opportunity)
        let opportunityNC = CuriosityBuilder.make(model: opportunityModel)
        let opportunityItem = UITabBarItem(title: "Opportunity", image: UIImage(named: "mars2"), selectedImage: UIImage(named: "mars2"))
        opportunityNC.tabBarItem = opportunityItem
        
        let spiritModel = MainBuilderModel(screenName: .Spirit)
        let spiritNC = CuriosityBuilder.make(model: spiritModel)
        let spiritItem = UITabBarItem(title: "Spirit", image: UIImage(named: "mars3"), selectedImage: UIImage(named: "mars3"))
        spiritNC.tabBarItem = spiritItem
        
        viewControllers = [curiosityNC, opportunityNC, spiritNC]
    }
}

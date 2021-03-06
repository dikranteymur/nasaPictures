//
//  CuriosityBuilder.swift
//  NasaPictures
//
//  Created by mdt on 1.12.2021.
//

import UIKit

final class CuriosityBuilder {
    static func make(model: MainBuilderModel) -> CuriosityNC {
        let storyboard = UIStoryboard(name: "CuriosityVC", bundle: Bundle.main)
        let navigationController = storyboard.instantiateViewController(withIdentifier: "CuriosityNC") as! CuriosityNC
        
        if let vc = navigationController.viewControllers.first as? CuriosityVC {
            vc.viewModel = CuriosityViewModel(service: app.service, mainBuilderModel: model)
            vc.mainBuilderModel = model
        }
        
        
        return navigationController
    }
}

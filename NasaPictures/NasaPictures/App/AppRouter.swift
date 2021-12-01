//
//  AppRouter.swift
//  NasaPictures
//
//  Created by mdt on 1.12.2021.
//

import UIKit

final class AppRouter {
    var window: UIWindow
    
    init() {
        window = UIWindow(frame: UIScreen.main.bounds)
    }
    
    func start() {
        let viewController = TabbarBuilder.make()
        let navigationController = UINavigationController(rootViewController: viewController)
        window.rootViewController = navigationController
        window.makeKeyAndVisible()
    }
    
}

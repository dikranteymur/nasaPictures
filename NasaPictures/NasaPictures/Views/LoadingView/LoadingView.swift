//
//  LoadingView.swift
//  NasaPictures
//
//  Created by mdt on 2.12.2021.
//

import UIKit
import Lottie

class LoadingView: UIView {

    static var shared = LoadingView()
    
    var animationView: AnimationView!
    var animationViewName = "mars_nasa_mission"
    
    init() {
        super.init(frame: UIScreen.main.bounds)
        let backgroundView = UIView()
        backgroundView.backgroundColor = .clear
        
        let width = frame.width * 0.5
        backgroundView.frame = CGRect(x: 0, y: 0, width: width, height: width)
        backgroundView.center = center
        addSubview(backgroundView)
        
        animationView = AnimationView(name: animationViewName)
        
        animationView.frame = CGRect(x: 0, y: 0, width: width, height: width)
        animationView.loopMode = .loop
        backgroundView.addSubview(animationView)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    

    public func startLoading(viewController: UIViewController, isLoading: Bool) {
        if isLoading {
            animationView.play()
            viewController.view.addSubview(self)
            
        } else {
            animationView.stop()
            self.removeFromSuperview()
        }
    }
    
    
}

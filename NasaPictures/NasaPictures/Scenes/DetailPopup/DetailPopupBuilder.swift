//
//  PopupBuilder.swift
//  NasaPictures
//
//  Created by mdt on 2.12.2021.
//

import Foundation
import UIKit

final class DetailPopupBuilder {
    static func make(with viewModel: DetailPopupViewModelProtocol) -> DetailPopupVC {
        let storyboard = UIStoryboard(name: "DetailPopupVC", bundle: nil)
        let viewController = storyboard.instantiateViewController(withIdentifier: "DetailPopupVC") as! DetailPopupVC
        viewController.viewModel = viewModel
        return viewController
        
        
    }
}

//
//  FilterBuilder.swift
//  NasaPictures
//
//  Created by mdt on 2.12.2021.
//

import UIKit

final class FilterBuilder {
    static func make(with viewModel: FilterViewModelProtocol) -> FilterVC {
        let storyboard = UIStoryboard(name: "FilterVC", bundle: nil)
        let viewController = storyboard.instantiateViewController(withIdentifier: "FilterVC") as! FilterVC
        viewController.viewModel = viewModel
        return viewController
    }
}

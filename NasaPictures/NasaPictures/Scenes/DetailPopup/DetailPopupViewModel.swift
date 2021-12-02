//
//  PopupViewModel.swift
//  NasaPictures
//
//  Created by mdt on 2.12.2021.
//

import Foundation

final class DetailPopupViewModel: DetailPopupViewModelProtocol {
    var delegate: DetailPopupViewModelDelegate?
    private var model: Photo
    
    init(model: Photo) {
        self.model = model
    }
    
    
    func load() {
        delegate?.showDetailPopup(with: model)
    }
    
    
}

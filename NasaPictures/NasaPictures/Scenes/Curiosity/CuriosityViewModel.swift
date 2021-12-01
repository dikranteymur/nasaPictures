//
//  CuriosityViewModel.swift
//  NasaPictures
//
//  Created by mdt on 1.12.2021.
//

import Foundation

final class CuriosityViewModel: CuriosityViewModelProtocol {
    var delegate: CuriosityViewModelDelegate?
    private var photos: [Photo] = []
    
    
    func load() {
        delegate?.handleOutput(.updateTitle("Curiosity"))
        delegate?.handleOutput(.setLoading(true))
    }
    
    func selectCamera(at index: Int) {
        
    }
    
    
}

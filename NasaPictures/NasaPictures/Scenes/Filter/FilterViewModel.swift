//
//  FilterViewModel.swift
//  NasaPictures
//
//  Created by mdt on 2.12.2021.
//

import Foundation

final class FilterViewModel: FilterViewModelProtocol {
    var delegate: FilterViewModelDelegate?
    private var list: [String]
    
    init(list: [String]) {
        self.list = list
    }
    
    func load() {
        delegate?.handleFilter(camerasName: list)
    }
    
    func selectedFilter(for camaras: [Camera]) {
        
    }
    
    
}

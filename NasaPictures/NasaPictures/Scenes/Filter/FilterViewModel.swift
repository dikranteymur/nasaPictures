//
//  FilterViewModel.swift
//  NasaPictures
//
//  Created by mdt on 2.12.2021.
//

import Foundation

final class FilterViewModel: FilterViewModelProtocol {
    var delegate: FilterViewModelDelegate?
    
    func load() {
        delegate?.showFilter()
    }
    
    func selectedFilter(for camaras: [Camera]) {
        delegate?.handleFilter()
    }
    
    
}

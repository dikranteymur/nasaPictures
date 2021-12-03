//
//  FilterViewModel.swift
//  NasaPictures
//
//  Created by mdt on 2.12.2021.
//

import Foundation

final class FilterViewModel: FilterViewModelProtocol {
    var delegate: FilterViewModelDelegate?
    var resendDelegate: SendFiltereListDelegate?
    
    private var list: [String]
    private var mainBuilderModel: MainBuilderModel
    
    init(list: [String], mainBuilderModel: MainBuilderModel) {
        self.list = list
        self.mainBuilderModel = mainBuilderModel
    }
    
    func load() {
        delegate?.handleFilter(camerasName: list)
    }

    func sendFiltered(list: [String]) {
        resendDelegate?.sendFiltered(list: list)
    }
    
}

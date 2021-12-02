//
//  FilterContracts.swift
//  NasaPictures
//
//  Created by mdt on 2.12.2021.
//

import Foundation

protocol FilterViewModelDelegate {
    func showFilter()
    func handleFilter(camerasName: [String])
}

protocol FilterViewModelProtocol {
    var delegate: FilterViewModelDelegate? { get set }
    func load()
    func selectedFilter(for camaras: [Camera])
}

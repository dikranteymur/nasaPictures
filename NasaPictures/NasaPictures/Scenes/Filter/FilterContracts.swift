//
//  FilterContracts.swift
//  NasaPictures
//
//  Created by mdt on 2.12.2021.
//

import Foundation

protocol SendFiltereListDelegate {
    func sendFiltered(list: [String])
}

protocol FilterViewModelDelegate {
    func handleFilter(camerasName: [String])
}

protocol FilterViewModelProtocol {
    var delegate: FilterViewModelDelegate? { get set }
    func load()
    func sendFiltered(list: [String])
}

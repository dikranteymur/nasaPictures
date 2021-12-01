//
//  CuriosityContracts.swift
//  NasaPictures
//
//  Created by mdt on 1.12.2021.
//

import Foundation

protocol CuriosityViewModelProtocol {
    var delegate: CuriosityViewModelDelegate? { get set }
    func load()
    func selectCamera(at index: Int)
    // TODO: filtreye gore load fonksiyonu eklenebilir
}

enum CuriosityViewModelOutput {
    case updateTitle(String)
    case setLoading(Bool)
    case showPhotos([Photo])
}

enum CuriosityViewRoute {
    case detail
    case filter
}

protocol CuriosityViewModelDelegate {
    func handleOutput(_ output: CuriosityViewModelOutput)
    func navigate(to route: CuriosityViewRoute)
    
}

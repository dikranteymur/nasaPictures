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
    func selectPhoto(at index: Int)
    func selectFilter(camera: CamerasName)
}

enum CuriosityViewModelOutput {
    case updateTitle(String)
    case setLoading(Bool)
    case showPhotos([Photo])
    case showFilteredPhotos([Photo])
}

enum CuriosityViewRoute {
    case detail(DetailPopupViewModel)
    case filter
}

protocol CuriosityViewModelDelegate {
    func handleOutput(_ output: CuriosityViewModelOutput)
    func navigate(to route: CuriosityViewRoute)
    
}

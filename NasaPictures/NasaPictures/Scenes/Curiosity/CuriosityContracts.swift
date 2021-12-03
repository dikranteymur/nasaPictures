//
//  CuriosityContracts.swift
//  NasaPictures
//
//  Created by mdt on 1.12.2021.
//

import Foundation

protocol CuriosityViewModelProtocol {
    var delegate: CuriosityViewModelDelegate? { get set }
    func load(page: Int)
    func setTitle()
    func selectPhoto(at index: Int, list: [Photo])
    func selectFilter(model: [Photo])
}

enum CuriosityViewModelOutput {
    case updateTitle(String)
    case setLoading(Bool)
    case showPhotos([Photo])
    case showFilteredList([String])
}

enum CuriosityViewRoute {
    case detail(DetailPopupViewModel)
    case filter(FilterViewModel, MainBuilderModel)
}

protocol CuriosityViewModelDelegate {
    func handleOutput(_ output: CuriosityViewModelOutput)
    func navigate(to route: CuriosityViewRoute)
    
}

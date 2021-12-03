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
    private var filteredPhotos: [Photo] = []
    private var camerasName: [String] = []
    private let service: AppService
    private var isFiltered: Bool = false
    private var filteredList: [String] = []

    var mainBuilderModel: MainBuilderModel
    
    init(service: AppService, mainBuilderModel: MainBuilderModel) {
        self.service = service
        self.mainBuilderModel = mainBuilderModel
    }
    
    func setTitle() {

        delegate?.handleOutput(.updateTitle(mainBuilderModel.screenName.name))
        
    }
    
    func load(page: Int) {
        delegate?.handleOutput(.setLoading(true))
       
        service.sendRequest(roverName: mainBuilderModel.screenName, page: page) { result in
            switch result {
                case .success(let model):
                    if let photos = model.photos {
                        self.photos.append(contentsOf: photos)
                        self.delegate?.handleOutput(.showPhotos(self.photos))
                    }
                    
                    // Set Filter list
                    for photo in self.photos {
                        if let name = photo.camera?.name {
                            if !self.camerasName.contains(name) {
                                self.camerasName.append(name)
                            }
                        }
                    }
                    
                    self.mainBuilderModel.setFilterListToUserdefault(list: self.camerasName)
                    self.delegate?.handleOutput(.showFilteredList(self.camerasName))
                    
                    self.delegate?.handleOutput(.setLoading(false))
                    break
                case .failure(let error):
                    print(error)
                    break
            }
        }
        
        
    }
    
    func selectPhoto(at index: Int, list: [Photo]) {
        let photo = list[index]
        let viewModel = DetailPopupViewModel(model: photo)
        delegate?.navigate(to: .detail(viewModel))
        
    }
    
    func selectFilter(model: [Photo]) {
        for photo in model {
            if let name = photo.camera?.name {
                if !camerasName.contains(name) {
                    camerasName.append(name)
                }
            }
        }
        
        let viewModel = FilterViewModel(list: camerasName, mainBuilderModel: mainBuilderModel)
        viewModel.resendDelegate = self
        delegate?.navigate(to: .filter(viewModel, mainBuilderModel))
        
    }
}


extension CuriosityViewModel: SendFiltereListDelegate {
    func sendFiltered(list: [String]) {
        delegate?.handleOutput(.showFilteredList(list))
    }
}

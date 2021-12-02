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
    
    init(service: AppService) {
        self.service = service
    }
    
    func setTitle() {
        delegate?.handleOutput(.updateTitle("Curiosity"))
    }
    
    func load(page: Int) {
        delegate?.handleOutput(.setLoading(true))
        
        service.sendRequest(roverName: .Curiosity, page: page) { result in
            switch result {
                case .success(let model):
                    self.delegate?.handleOutput(.setLoading(false))
                    if let photos = model.photos {
                        self.photos += photos
                        self.delegate?.handleOutput(.showPhotos(self.photos))
                        print("Photos count: \(page)-\(self.photos.count)")
//                        self.page += 1
                    }
                    break
                case .failure(let error):
                    print(error)
                    break
            }
        }
    }
    
    func selectPhoto(at index: Int) {
        let photo = photos[index]
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
        
        let viewModel = FilterViewModel(list: camerasName)
        delegate?.navigate(to: .filter(viewModel))
        delegate?.handleOutput(.showFilteredPhotos(filteredPhotos))
        
    }
}



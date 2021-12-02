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
    private let service: AppService
    
    init(service: AppService) {
        self.service = service
    }
    
    func load() {
        delegate?.handleOutput(.updateTitle("Curiosity"))
        delegate?.handleOutput(.setLoading(true))
        
        service.sendRequest(roverName: .Curiosity, page: 1) { result in
            switch result {
                case .success(let model):
                    self.delegate?.handleOutput(.setLoading(false))
                    if let photos = model.photos {
                        self.delegate?.handleOutput(.showPhotos(photos))
                        self.photos = photos
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
    
    func selectFilter(camera: CamerasName) {
        filteredPhotos = photos.filter({ $0.camera?.name == camera.rawValue })
        delegate?.handleOutput(.showFilteredPhotos(filteredPhotos))
    }
}

enum CamerasName: String {
    case FHAZ
    case RHAZ
    case MAST
    case CHEMCAM
    case MAHLI
    case MARDI
    case NAVCAM
    case PANCAM
    case MINITES
}

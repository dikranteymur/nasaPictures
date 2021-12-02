//
//  PopupContracts.swift
//  NasaPictures
//
//  Created by mdt on 2.12.2021.
//

import Foundation

protocol DetailPopupViewModelDelegate {
    func showDetailPopup(with detailModel: Photo)
}


protocol DetailPopupViewModelProtocol {
    var delegate: DetailPopupViewModelDelegate? { get set }
    func load()
}

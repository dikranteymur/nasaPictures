//
//  AppContainer.swift
//  NasaPictures
//
//  Created by mdt on 1.12.2021.
//

import UIKit

let app = AppContainer()

final class AppContainer {
    let service = AppService()
    let router = AppRouter()
}

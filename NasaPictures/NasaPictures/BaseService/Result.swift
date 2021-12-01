//
//  Result.swift
//  NasaPictures
//
//  Created by mdt on 1.12.2021.
//

import Foundation
import Alamofire

public enum Result<Value> {
    case success(Value)
    case failure(AFError)
}

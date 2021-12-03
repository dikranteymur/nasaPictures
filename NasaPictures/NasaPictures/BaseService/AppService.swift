//
//  BaseService.swift
//  NasaPictures
//
//  Created by mdt on 1.12.2021.
//

import Foundation
import Alamofire
import ObjectMapper

final class AppService {
    
    // TODO: - https://api.nasa.gov/mars-photos/api/v1/rovers/curiosity/photos?sol=1000&api_key=DEMO_KEY&page=1
    
    private let baseUrl = "https://api.nasa.gov/mars-photos/api/v1/rovers/"
    private let apiKey = "SxHjglRWgEQXF55qBf35X61gRk9kl75I6ilYNJme"
    
    public func sendRequest(roverName: Rovers, page: Int, completion: @escaping (Result<BaseResponseModel>) -> Void) {
        var url: String = ""
        let extensionUrl = "/photos?sol=1000&api_key=\(apiKey)&page=" + String(page)
        
        switch roverName {
            case .Curiosity:
                url = baseUrl + roverName.rawValue + extensionUrl
            case .Opportunity:
                url = baseUrl + roverName.rawValue + extensionUrl
            case .Spirit:
                url = baseUrl + roverName.rawValue + extensionUrl
        }
        AF.request(url, method: .get, parameters: nil, encoding: JSONEncoding.default).responseJSON { response in

            switch response.result {
                case .success(let value):
                    let result = value as! NSDictionary
                    if let model = Mapper<BaseResponseModel>().map(JSONObject: result) {
                        completion(.success(model))
                    }
                case .failure(let error):
                    completion(.failure(error))
            }
        }
    }
}


enum Rovers: String {
    case Curiosity = "curiosity"
    case Opportunity = "opportunity"
    case Spirit = "spirit"
}

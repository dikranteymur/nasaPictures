//
//  BaseResponseModel.swift
//  NasaPictures
//
//  Created by mdt on 1.12.2021.
//

import ObjectMapper


class BaseResponseModel: Mappable {
    var photos: [Photo]?
    
    init() {}
    
    required init?(map: Map) {
        
    }
    
    func mapping(map: Map) {
        photos <- map["photos"]
    }
}

class Photo: Mappable {
    var id: Int?
    var sol: Int?
    var camera: Camera?
    var img_src: String?
    var earth_date: String?
    var rover: Rover?
    
    required init?(map: Map) {
        
    }
    
    func mapping(map: Map) {
        id <- map["id"]
        sol <- map["sol"]
        camera <- map["camera"]
        img_src <- map["img_src"]
        earth_date <- map["earth_date"]
        rover <- map["rover"]
    }
}


class Camera: Mappable {
    var id: Int?
    var name: String?
    var rover_id: Int?
    var full_name: String?
    
    required init?(map: Map) {
        
    }
    
    func mapping(map: Map) {
        id <- map["id"]
        name <- map["name"]
        rover_id <- map["rover_id"]
        full_name <- map["phfull_nameotos"]
        
    }
}

class Rover: Mappable {
    var id: Int?
    var name: String?
    var landing_date: String?
    var launch_date: String?
    var status: String?
    
    required init?(map: Map) {
        
    }
    
    func mapping(map: Map) {
        id <- map["id"]
        name <- map["name"]
        landing_date <- map["landing_date"]
        launch_date <- map["launch_date"]
        status <- map["status"]
    }
}

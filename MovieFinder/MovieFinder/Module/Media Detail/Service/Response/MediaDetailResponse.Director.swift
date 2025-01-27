//
//  MediaDetailResponse.Director.swift
//  MovieFinder
//
//  Created by Arman on 1/27/25.
//

import Foundation

extension  MediaDetailResponse {
    struct Director: Decodable, Mappable {
        
        let castName: String
        
        typealias T = MediaDetailModel.Director
        func map() -> MediaDetailModel.Director {
            T(castName: castName)
        }
    }
}

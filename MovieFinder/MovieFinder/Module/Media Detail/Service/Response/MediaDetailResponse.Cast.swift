//
//  MediaDetailResponse.Cast.swift
//  MovieFinder
//
//  Created by Arman on 1/27/25.
//

import Foundation

extension  MediaDetailResponse {
    struct Cast: Decodable, Mappable {
        
        let castName: String
        
        typealias T = MediaDetailModel.Cast
        func map() -> MediaDetailModel.Cast {
            T(castName: castName)
        }
    }
}

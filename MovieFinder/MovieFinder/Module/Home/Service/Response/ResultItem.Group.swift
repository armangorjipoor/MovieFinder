//
//  ResultItem.Group.swift
//  MovieFinder
//
//  Created by Arman on 1/27/25.
//

import Foundation

extension HomeResponse.ResultItem {
    struct Groups: Decodable, Mappable {
        
        let media: Media?
        let cast: Cast?
        
        enum CodingKeys: String, CodingKey {
            case media = "Media"
            case cast = "Cast"
        }
        
        typealias T = HomeModel.ResultItem.Group
        func map() -> HomeModel.ResultItem.Group {
            T(media: media?.map(), cast: cast?.map())
        }
       
    }
}

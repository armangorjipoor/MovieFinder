//
//  ResultItem.Group.Media.Item.swift
//  MovieFinder
//
//  Created by Arman on 1/27/25.
//

import Foundation

extension HomeResponse.ResultItem.Groups.Media {
    
    struct Item: Decodable, Mappable {
        let id: String
        let name: String
        let imageUrl: String
        let url: String
        
        enum CodingKeys: String, CodingKey {
            case id, name, url, imageUrl = "image_url"
        }
        
        typealias T = HomeModel.ResultItem.Group.Media.Item
        func map() -> HomeModel.ResultItem.Group.Media.Item {
            T(id: id, name: name, imageUrl: imageUrl)
        }
        
    }
}

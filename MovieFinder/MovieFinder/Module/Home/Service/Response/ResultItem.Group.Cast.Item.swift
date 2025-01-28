//
//  ResultItem.Group.Cast.Item.swift
//  MovieFinder
//
//  Created by Arman on 1/27/25.
//

import Foundation

extension HomeResponse.ResultItem.Groups.Cast {
    struct Item: Decodable, Mappable {
        
        let id: String
        let name: String
        let url: String
        let imageUrl: String
        let description: String

        enum CodingKeys: String, CodingKey {
            case id, name, url, imageUrl = "image_url", description
        }
        
        
        typealias T = HomeModel.ResultItem.Group.Cast.Item
        func map() -> HomeModel.ResultItem.Group.Cast.Item {
            T(id: id, name: name, url: url, imageUrl: imageUrl, description: description)
        }
    }
}

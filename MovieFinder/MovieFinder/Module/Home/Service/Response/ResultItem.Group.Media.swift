//
//  ResultItem.Group.Media.swift
//  MovieFinder
//
//  Created by Arman on 1/27/25.
//

import Foundation

extension HomeResponse.ResultItem.Groups {
    struct Media: Decodable, Mappable {
        
        let total: Int
        let items: [Item]?
        
        enum CodingKeys: CodingKey {
            case total
            case items
        }
        
        init(from decoder: any Decoder) throws {
            let container: KeyedDecodingContainer<HomeResponse.ResultItem.Groups.Media.CodingKeys> = try decoder.container(keyedBy: HomeResponse.ResultItem.Groups.Media.CodingKeys.self)
            self.total = try container.decode(Int.self, forKey: HomeResponse.ResultItem.Groups.Media.CodingKeys.total)
            self.items = try container.decodeIfPresent([HomeResponse.ResultItem.Groups.Media.Item].self, forKey: HomeResponse.ResultItem.Groups.Media.CodingKeys.items)
        }
        
        typealias T = HomeModel.ResultItem.Group.Media
        func map() -> HomeModel.ResultItem.Group.Media {
            if let items = items {
                T(total: total, items: items.map({$0.map()}))
            } else {
                T(total: total, items: [])
            }
        }
    }
}

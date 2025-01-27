//
//  ResultItem.Group.Cast.swift
//  MovieFinder
//
//  Created by Arman on 1/27/25.
//

import Foundation

extension HomeResponse.ResultItem.Groups {
    struct Cast: Decodable, Mappable {
        
        let total: Int
        let items: [Item]?
        let queryId: String
        
        enum CodingKeys: CodingKey {
            case total
            case items
            case queryId
        }
        
        init(from decoder: any Decoder) throws {
            let container: KeyedDecodingContainer<HomeResponse.ResultItem.Groups.Cast.CodingKeys> = try decoder.container(keyedBy: HomeResponse.ResultItem.Groups.Cast.CodingKeys.self)
            self.total = try container.decode(Int.self, forKey: HomeResponse.ResultItem.Groups.Cast.CodingKeys.total)
            self.items = try container.decodeIfPresent([HomeResponse.ResultItem.Groups.Cast.Item].self, forKey: HomeResponse.ResultItem.Groups.Cast.CodingKeys.items)
            self.queryId = try container.decode(String.self, forKey: HomeResponse.ResultItem.Groups.Cast.CodingKeys.queryId)
        }
        typealias T = HomeModel.ResultItem.Group.Cast
        func map() -> HomeModel.ResultItem.Group.Cast {
            if let items = items {
                T(total: total, items: items.map({$0.map()}))
            } else {
                T(total: total, items: [])
            }
        }
    }
}

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
        let items: [Item]
        let queryId: String
        
        typealias T = HomeModel.ResultItem.Group.Cast
        func map() -> HomeModel.ResultItem.Group.Cast {
            T(total: total, items: items.map({$0.map()}))
        }
    }
}

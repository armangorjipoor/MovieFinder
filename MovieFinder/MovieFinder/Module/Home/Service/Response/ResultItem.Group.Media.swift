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
        let items: [Item]
        
        typealias T = HomeModel.ResultItem.Group.Media
        
        func map() -> HomeModel.ResultItem.Group.Media {
            T(total: total, items: items.map({$0.map()}))
        }
    }
}

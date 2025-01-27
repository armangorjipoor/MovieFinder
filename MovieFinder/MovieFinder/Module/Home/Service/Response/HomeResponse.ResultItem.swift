//
//  HomeResponse.ResultItem.swift
//  MovieFinder
//
//  Created by Arman on 1/27/25.
//

import Foundation

extension HomeResponse {
    struct ResultItem: Decodable, Mappable {
        
        let total: Int
        let groups: Groups
        
        typealias T = HomeModel.ResultItem
        func map() -> HomeModel.ResultItem {
            T(total: total, groups: groups.map())
        }
    }
}

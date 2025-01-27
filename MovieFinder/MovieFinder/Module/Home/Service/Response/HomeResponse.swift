//
//  MediaListResponse.swift
//  MovieFinder
//
//  Created by Arman on 1/26/25.
//

import Foundation

struct HomeResponse: Decodable, Mappable {
    
       let page: Int?
       let isSucceed: Bool
       let resultItems: [ResultItem]
       
       enum CodingKeys: String, CodingKey {
           case page, isSucceed = "is_succeed", resultItems = "result_items"
       }
    
    
    typealias T = HomeModel
    func map() -> HomeModel {
        T(page: page ?? 0, isSucceed: isSucceed, resultItems: resultItems.map({$0.map()}))
    }
}


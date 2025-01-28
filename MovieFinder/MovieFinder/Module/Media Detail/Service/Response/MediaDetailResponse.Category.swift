//
//  MediaDetailResponse.Category.swift
//  MovieFinder
//
//  Created by Arman on 1/27/25.
//

import Foundation

extension MediaDetailResponse {
    struct Category: Decodable, Mappable {
        
        let categoryName: String
        
        typealias T = MediaDetailModel.Category
        func map() -> MediaDetailModel.Category {
            T(categoryName: categoryName)
        }
        
    }
}

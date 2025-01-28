//
//  MediaDetailResponse.swift
//  MovieFinder
//
//  Created by Arman on 1/27/25.
//

import Foundation

struct MediaDetailResponse: Decodable, Mappable {
    let caption: String
    let imageUrl: String
    let teaserText: String
    let casts: [MediaDetailResponse.Cast]
    let directors: [MediaDetailResponse.Director]
    let categories: [MediaDetailResponse.Category]
    
    typealias T = MediaDetailModel
    func map() -> MediaDetailModel {
        T(caption: caption,
          imageUrl: imageUrl,
          teaserText: teaserText,
          casts: casts.map{$0.map()},
          directors: directors.map{$0.map()},
          categories: categories.map{$0.map()})
    }
}

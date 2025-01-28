//
//  MediaDetailModel.swift
//  MovieFinder
//
//  Created by Arman on 1/27/25.
//

import Foundation

struct MediaDetailModel {
    
    let caption: String
    let imageUrl: String
    let teaserText: String
    let casts: [MediaDetailModel.Cast]
    let directors: [MediaDetailModel.Director]
    let categories: [MediaDetailModel.Category]
}

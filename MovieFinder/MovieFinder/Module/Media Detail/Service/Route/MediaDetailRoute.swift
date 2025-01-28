//
//  MediaDetailRoute.swift
//  MovieFinder
//
//  Created by Arman on 1/27/25.
//

import Foundation

enum MediaDetailRoute: RawRepresentable {
    case mediaDetail(String)
    case relativeImageUrl
    typealias RawValue = String
    
    var rawValue: String {
        switch self {
        case .mediaDetail(let id):
            return "/v1.0/medias/\(id)/preview"
        case .relativeImageUrl :
            return "https://static.namava.ir"
        }
    }
    
    init?(rawValue: String) { nil }
}

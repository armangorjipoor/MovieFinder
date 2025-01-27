//
//  MediaDetailRoute.swift
//  MovieFinder
//
//  Created by Arman on 1/27/25.
//

import Foundation

enum MediaDetailRoute: RawRepresentable {
    case mediaDetail(String)
    typealias RawValue = String
    
    var rawValue: String {
        switch self {
        case .mediaDetail(let id):
            return "/v1.0/medias/\(id)/preview"
        }
    }
    
    init?(rawValue: String) { nil }
}

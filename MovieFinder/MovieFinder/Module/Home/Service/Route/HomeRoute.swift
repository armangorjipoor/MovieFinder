//
//  MediaListRoute.swift
//  MovieFinder
//
//  Created by Arman on 1/26/25.
//

import Foundation

enum MediaListRoute: RawRepresentable {
    case search
    typealias RawValue = String
    
    var rawValue: String {
        switch self {
        case .search: return "/services"
        }
    }
    
    init?(rawValue: String) { nil }
}

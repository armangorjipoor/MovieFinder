//
//  HomeRoute.swift
//  MovieFinder
//
//  Created by Arman on 1/26/25.
//

import Foundation

enum HomeRoute: RawRepresentable {
    case search
    typealias RawValue = String
    
    var rawValue: String {
        switch self {
        case .search: return "/v5.0/search/advance"
        }
    }
    
    init?(rawValue: String) { nil }
}

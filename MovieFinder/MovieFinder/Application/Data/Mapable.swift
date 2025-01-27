//
//  Mapable.swift
//  MovieFinder
//
//  Created by Arman on 1/26/25.
//

import Foundation

protocol Mappable {
    associatedtype T
    func map() -> T
}

//
//  DependencyManagerProtocol.swift
//  MovieFinder
//
//  Created by Arman on 1/26/25.
//

import Foundation
public protocol DependencyManagerProtocol {
    func resolve<DependencyType>(type: DependencyType.Type, arguments: [Any]) -> DependencyType
    func register<DependencyType>(type: DependencyType.Type, dependency: @escaping ([Any]) -> (DependencyType))
}

//
//  DependencyManager.swift
//  MovieFinder
//
//  Created by Arman on 1/26/25.
//

import Foundation

public class DependencyManager: DependencyManagerProtocol {
    
    public static let shared: DependencyManagerProtocol = DependencyManager()
    
    private var registeredDependencies: [String: (([Any]) -> (Any))] = [:]
    
    private func dependencyKey<DependencyType>(for type: DependencyType.Type) -> String {
        String(describing: type)
    }
    
    public func register<DependencyType>(type: DependencyType.Type, dependency: @escaping ([Any]) -> (DependencyType)) {
        let key: String = dependencyKey(for: type)
        registeredDependencies[key] = dependency
    }
    
    public func resolve<DependencyType>(type: DependencyType.Type, arguments: [Any] = []) -> DependencyType {
        let key: String = dependencyKey(for: type)
        guard let dependency = registeredDependencies[key]?(arguments) as? DependencyType else {
            preconditionFailure("Resolve exception: please first register dependecny: \(key)")
        }
        return dependency
    }

    private init() {
        repositoryRegistery()
        viewModelRegistry()
    }
}

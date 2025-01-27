//
//  DependencyManager+ViewModle.swift
//  MovieFinder
//
//  Created by Arman on 1/26/25.
//

import Foundation
extension DependencyManager {
    
    func repositoryRegistery() {
        
        register(type: HomeServiceRepositoryProtocol.self) { [unowned self] _ in
            let repository: HomeServiceRepositoryProtocol = HomeServiceRepository()
            return repository
        }
    }
    
    
    func viewModelRegistry() {
        register(type: HomeViewModelProtocol.self) { [unowned self] _ in
            let repository: HomeServiceRepositoryProtocol = resolve(type: HomeServiceRepositoryProtocol.self, arguments: [])
            let vm: HomeViewModelProtocol = HomeViewModel(repository: repository)
            return vm
        }
    }
}

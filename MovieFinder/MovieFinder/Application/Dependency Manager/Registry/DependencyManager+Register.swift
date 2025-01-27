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
        
        register(type: MediaDetailServiceRepositoryProtocol.self) { [unowned self] _ in
            let repository: MediaDetailServiceRepositoryProtocol = MediaDetailServiceRepository()
            return repository
        }
    }
    
    
    func viewModelRegistry() {
        register(type: MediaDetailViewModelProtocol.self) { [unowned self] arguments in
            let mediaId: Int = arguments[0] as! Int
            
            let repository: MediaDetailServiceRepositoryProtocol = resolve(type: MediaDetailServiceRepositoryProtocol.self, arguments: [])
            let vm: MediaDetailViewModelProtocol = MediaDetailViewModel(repository: repository, mediaId: mediaId)
            return vm
        }
        
        register(type: HomeViewModelProtocol.self) { [unowned self] _ in
            let repository: HomeServiceRepositoryProtocol = resolve(type: HomeServiceRepositoryProtocol.self, arguments: [])
            let vm: HomeViewModelProtocol = HomeViewModel(repository: repository)
            return vm
        }
    }
}

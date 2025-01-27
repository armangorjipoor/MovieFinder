//
//  BaseServiceRepository.swift
//  MovieFinder
//
//  Created by Arman on 1/26/25.
//

import Foundation


//TODO: init with our DI system
class BaseServiceRepository: BaseServiceRepositoryProtocol {
    
    lazy var network: NetworkProtocol = Network(sessionManager: NetworkSession())
}


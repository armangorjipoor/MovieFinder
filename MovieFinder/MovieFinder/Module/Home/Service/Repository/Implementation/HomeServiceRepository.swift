//
//  HomeServiceRepository.swift
//  MovieFinder
//
//  Created by Arman on 1/26/25.
//

import Foundation
import Combine

class HomeServiceRepository: BaseServiceRepository, HomeServiceRepositoryProtocol {
    func search(via text: String) -> AnyPublisher<HomeModel, any Error> {
        network.get(path: HomeRoute.search.rawValue, parameter: nil)
                .tryMap { data -> HomeModel in
                    let response = try JSONDecoder().decode(HomeResponse.self, from: data)
                    return response.map()
                }
                .eraseToAnyPublisher()
    }
}

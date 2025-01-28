//
//  HomeServiceRepository.swift
//  MovieFinder
//
//  Created by Arman on 1/26/25.
//

import Foundation
import Combine

class HomeServiceRepository: BaseServiceRepository, HomeServiceRepositoryProtocol {
    func search(via text: String, count: Int, page: Int) -> AnyPublisher<HomeModel, any Error> {
        network.get(path: HomeRoute.search.rawValue, parameter: [("count", "\(count)"), ("page", "\(page)"), ("query", text)])
                .tryMap { data -> HomeModel in
                    let response = try JSONDecoder().decode(ItemResponse<HomeResponse>.self, from: data)
                    return response.result.map()
                }
                .eraseToAnyPublisher()
    }
}

//
//  MediaDetailServiceRepository.swift
//  MovieFinder
//
//  Created by Arman on 1/27/25.
//

import Foundation
import Combine

class MediaDetailServiceRepository: BaseServiceRepository, MediaDetailServiceRepositoryProtocol {
    func search(via text: String, count: Int, page: Int) -> AnyPublisher<HomeModel, any Error> {
        network.get(path: HomeRoute.search.rawValue, parameter: ["count" : "\(count)", "page" : "\(page)", "query" : text])
                .tryMap { data -> HomeModel in
                    JSONSerialization.printJSON(with: data)
                    let response = try JSONDecoder().decode(ItemResponse<HomeResponse>.self, from: data)
                    return response.result.map()
                }
                .eraseToAnyPublisher()
    }
}


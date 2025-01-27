//
//  MediaDetailServiceRepository.swift
//  MovieFinder
//
//  Created by Arman on 1/27/25.
//

import Foundation
import Combine

class MediaDetailServiceRepository: BaseServiceRepository, MediaDetailServiceRepositoryProtocol {
    func getMediaDetail(with id: String) -> AnyPublisher<MediaDetailModel, any Error> {
        network.get(path: HomeRoute.search.rawValue, parameter: nil)
                .tryMap { data -> MediaDetailModel in
                    JSONSerialization.printJSON(with: data)
                    let response = try JSONDecoder().decode(ItemResponse<MediaDetailResponse>.self, from: data)
                    return response.result.map()
                }
                .eraseToAnyPublisher()
    }
}


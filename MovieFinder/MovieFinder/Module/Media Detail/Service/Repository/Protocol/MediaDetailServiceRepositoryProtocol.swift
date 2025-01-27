//
//  MediaDetailServiceRepositoryProtocol.swift
//  MovieFinder
//
//  Created by Arman on 1/27/25.
//

import Foundation
import Combine

protocol MediaDetailServiceRepositoryProtocol {
    func getMediaDetail(with id: String) -> AnyPublisher<MediaDetailModel, any Error>
}

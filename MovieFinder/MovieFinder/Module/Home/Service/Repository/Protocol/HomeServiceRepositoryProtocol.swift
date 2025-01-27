//
//  HomeServiceRepositoryProtocol.swift
//  MovieFinder
//
//  Created by Arman on 1/26/25.
//

import Foundation
import Combine

protocol HomeServiceRepositoryProtocol: BaseServiceRepositoryProtocol {
    func search(via text: String) -> AnyPublisher<HomeModel, Error>
}

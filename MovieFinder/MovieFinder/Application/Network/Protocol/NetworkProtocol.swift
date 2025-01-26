//
//  NetworkProtocol.swift
//  Namava
//
//  Created by Arman on 1/25/25.
//

import Foundation
import Combine

protocol NetworkProtocol: NSObjectProtocol {
    func get(path: String, parameter: [String: String]?, retryOnNoConnection: Bool, includeToken: Bool) -> AnyPublisher<Data, Error>
    func post(path: String, payload: Encodable?, retryOnNoConnection: Bool, includeToken: Bool) -> AnyPublisher<Data, Error>
//    func put(path: String, payload: Encodable?, retryOnNoConnection: Bool, includeToken: Bool) -> AnyPublisher<Data, Error> // No need on this state of development
}

//
//  NetworkSession.swift
//  Namava
//
//  Created by Arman on 1/25/25.
//

import Foundation

protocol NetworkSessionProtocol {
    var session: URLSession { get set }
}

class NetworkSession: NSObject, NetworkSessionProtocol, URLSessionDelegate {
    
    public lazy var session: URLSession = {
        let configuration = configuration
        let session = URLSession(configuration: configuration, delegate: self, delegateQueue: operationQueue)
        return session
    }()
    
    private lazy var operationQueue = OperationQueue()
    private lazy var configuration: URLSessionConfiguration = {
        let configuration = URLSessionConfiguration.default
        configuration.requestCachePolicy = .reloadIgnoringLocalAndRemoteCacheData
        return configuration
    }()
    
    
}

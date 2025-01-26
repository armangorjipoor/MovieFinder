//
//  SharedViewModelProtocol.swift
//  MovieFinder
//
//  Created by Arman on 1/26/25.
//

import Foundation
import Combine

protocol BaseViewModelProtocol {
    func loadData(first: Bool)
    func loadDataAutomatically(first: Bool)
    var statusPublisher: CurrentValueSubject<BaseViewModelStatusEnum, Never> { get set }
}

extension BaseViewModelProtocol {
    
    func loadDataAutomatically(first: Bool) {
        // You need to override this if you want automatic requests
    }
    
    func loadData(first: Bool) {
        // Default implementation can be overridden
    }
}

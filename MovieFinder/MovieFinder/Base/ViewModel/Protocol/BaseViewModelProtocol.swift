//
//  SharedViewModelProtocol.swift
//  MovieFinder
//
//  Created by Arman on 1/26/25.
//

import Foundation
import Combine

protocol BaseViewModelProtocol {
    func loadData()
    var statusPublisher: CurrentValueSubject<BaseViewModelStatusEnum, Never> { get set }
}

extension BaseViewModelProtocol {

    func loadData() {
        // Default implementation can be overridden
    }
}

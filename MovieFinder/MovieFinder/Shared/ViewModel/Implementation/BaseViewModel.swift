//
//  BaseViewModel.swift
//  MovieFinder
//
//  Created by Arman on 1/26/25.
//

import Foundation
import Combine

class BaseViewModel: BaseViewModelProtocol {
    var statusPublisher: CurrentValueSubject<BaseViewModelStatusEnum, Never> = .init(.none)
    var cancellables = Set<AnyCancellable>()
    
    init() {
        statusPublisher
            .handleEvents(receiveSubscription: { [unowned self] _ in
                loadDataAutomatically(first: true)
            })
            .sink { _ in }
            .store(in: &cancellables)
    }
    
    open func loadDataAutomatically(first: Bool) {
        // You need to override if you want automatic requests
    }
    
    open func loadData(first: Bool) {}
}



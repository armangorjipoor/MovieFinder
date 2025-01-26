//
//  BaseViewModel.swift
//  MovieFinder
//
//  Created by Arman on 1/26/25.
//

import Foundation
import Combine

class BaseViewModel: BaseViewModelProtocol {

    var cancellables = Set<AnyCancellable>()
    var statusPublisher: CurrentValueSubject<BaseViewModelStatusEnum, Never> = .init(.none)
    
    func loadData() { }
}



//
//  HomeViewModel.swift
//  MovieFinder
//
//  Created by Arman on 1/26/25.
//

import Foundation

class HomeViewModel: BaseViewModel, HomeViewModelProtocol {
    
    var dataset: [HomeModel] = []
    
    let repository: AddressServiceRepositoryProtocol
    
    init(repository: AddressServiceRepositoryProtocol) {
        self.repository = repository
        super.init()
    }
    
    override func loadData() {
        
        statusPublisher.value = .loading
        repository.addressList().do(onSuccess: { [weak self] dataset in
            guard let weak = self else { return }
            weak.dataset = dataset
            weak.statusRelay.accept(.loaded)
        }, onError: { [weak self] error in
            guard let weak = self else { return }
            weak.statusRelay.accept(.error(error: error as NSError))
        }).subscribe().disposed(by: disposeBag)
        
    }

}

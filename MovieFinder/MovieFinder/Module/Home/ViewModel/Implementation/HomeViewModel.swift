//
//  HomeViewModel.swift
//  MovieFinder
//
//  Created by Arman on 1/26/25.
//

import Foundation

class HomeViewModel: BaseViewModel, HomeViewModelProtocol {
    func doSearch(for term: String, count: Int, page: Int) {
        statusPublisher.value = .loading
        repository.search(via: term, count: count, page: page).sink(receiveCompletion: { [ weak self ] completion in
            guard let weakSelf = self else { return }
            switch completion {
            case .finished:
                print("Completed successfully")
            case .failure(let error):
                let err = error as NSError
                weakSelf.statusPublisher.value = .error(error: err)
            }
        }, receiveValue: { [weak self] dataSet in
            guard let weakSelf = self else { return }
            weakSelf.statusPublisher.value = .loaded
            print("Received addresses: \(dataSet)")
        })
        .store(in: &cancellables)
    }
    
    var mediaDataSet: HomeModel?

    let repository: HomeServiceRepositoryProtocol
    
    init(repository: HomeServiceRepositoryProtocol) {
        self.repository = repository
        super.init()
    }
    
    override func loadData() {
        
//        statusPublisher.value = .loading
//        repository.search(via: "").sink(receiveCompletion: { [ weak self ] completion in
//            guard let weakSelf = self else { return }
//            switch completion {
//            case .finished:
//                print("Completed successfully")
//            case .failure(let error):
//                let err = error as NSError
//                weakSelf.statusPublisher.value = .error(error: err)
//            }
//        }, receiveValue: { [weak self] dataSet in
//            guard let weakSelf = self else { return }
//            weakSelf.statusPublisher.value = .loaded
//            print("Received addresses: \(dataSet)")
//        })
//        .store(in: &cancellables)
        
    }
    
}

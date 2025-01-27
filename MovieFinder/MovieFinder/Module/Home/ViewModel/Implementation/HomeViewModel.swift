//
//  HomeViewModel.swift
//  MovieFinder
//
//  Created by Arman on 1/26/25.
//

import Foundation

class HomeViewModel: BaseViewModel, HomeViewModelProtocol {
    
    var mediaDataSet: HomeModel?

    let repository: HomeServiceRepositoryProtocol
    
    init(repository: HomeServiceRepositoryProtocol) {
        self.repository = repository
        super.init()
    }
    
    func doSearch(for term: String, count: Int, page: Int) {
        statusPublisher.value = .loading
        repository.search(via: term, count: count, page: page)
            .sink(receiveCompletion: { [weak self] completion in
                guard let self = self else { return }
                switch completion {
                case .finished:
                    print("Completed successfully")
                case .failure(let error):
                    print("🚫 Error occurred: \(error)")
                    let nsError = error as NSError
                    self.statusPublisher.value = .error(error: nsError)
                }
            }, receiveValue: { [weak self] dataSet in
                guard let self = self else { return }
                self.statusPublisher.value = .loaded
                self.mediaDataSet = dataSet
            })
            .store(in: &cancellables)
    }
    
}

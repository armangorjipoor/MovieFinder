//
//  HomeViewModel.swift
//  MovieFinder
//
//  Created by Arman on 1/26/25.
//

import Foundation

class HomeViewModel: BaseViewModel, HomeViewModelProtocol {
    var searchedTerm: String = ""
    var count: Int = 0
    var currentPage: Int = 1
    var isFetching: Bool = false
    
    var mediaDataSet: [HomeModel.ResultItem.Group.Media.Item]?
    var castDataSet: [HomeModel.ResultItem.Group.Cast.Item]?
    
    let repository: HomeServiceRepositoryProtocol
    
    init(repository: HomeServiceRepositoryProtocol) {
        self.repository = repository
        super.init()
    }
    
    func doSearch(for term: String, count: Int) {
        self.count = count
        self.searchedTerm = term
        self.currentPage = 1
        statusPublisher.value = .loading
        repository.search(via: term, count: count, page: currentPage)
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
            }, receiveValue: { [weak self] data in
                guard let self = self else { return }
                self.statusPublisher.value = .loaded
                self.mediaDataSet = data.mediaDataset
                self.castDataSet = data.castDataset
                self.currentPage += 1
            })
            .store(in: &cancellables)
    }
 
    func fetchNextPage() {
        guard !isFetching else { return }
        isFetching = true
        
        repository.search(via: searchedTerm, count: count, page: currentPage)
            .sink(receiveCompletion: { [weak self] completion in
                guard let self = self else { return }
                switch completion {
                case .finished:
                    isFetching = false
                    print("Completed successfully")
                case .failure(let error):
                    isFetching = false
                    let nsError = error as NSError
                    self.statusPublisher.value = .error(error: nsError)
                }
            }, receiveValue: { [weak self] data in
                
                guard let self = self else { return }
                self.isFetching = false
                self.currentPage += 1
                self.mediaDataSet?.append(contentsOf: data.mediaDataset)
                self.castDataSet?.append(contentsOf: data.castDataset)
                self.statusPublisher.value = .loaded
                
            })
            .store(in: &cancellables)
    }
}

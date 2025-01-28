//
//  MediaDetailViewModel.swift
//  MovieFinder
//
//  Created by Arman on 1/27/25.
//

import Foundation

class MediaDetailViewModel: BaseViewModel, MediaDetailViewModelProtocol {
    
    var detailModel: MediaDetailModel?
    
    let repository: MediaDetailServiceRepositoryProtocol
    let mediaId: String
    init(repository: MediaDetailServiceRepositoryProtocol, mediaId: String) {
        self.repository = repository
        self.mediaId = mediaId
        
        super.init()
    }
    
    override func loadData() {
        repository.getMediaDetail(with: mediaId)
            .sink(receiveCompletion: { [weak self] completion in
                guard let self = self else { return }
                switch completion {
                case .finished:
                    print("Completed successfully")
                case .failure(let error):
                    let nsError = error as NSError
                    self.statusPublisher.value = .error(error: nsError)
                }
            }, receiveValue: { [weak self] data in
                guard let self = self else { return }
                
                self.detailModel = data
                self.statusPublisher.value = .loaded
                
            })
            .store(in: &cancellables)
    }
}

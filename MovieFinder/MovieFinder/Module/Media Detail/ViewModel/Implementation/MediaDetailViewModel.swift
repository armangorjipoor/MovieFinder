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
    let mediaId: Int
    init(repository: MediaDetailServiceRepositoryProtocol, mediaId: Int) {
        self.repository = repository
        self.mediaId = mediaId
        
        super.init()
    }
    
    func getDetail(for id: Int) {
        
    }
}

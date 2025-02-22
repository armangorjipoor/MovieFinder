//
//  MediaDetailViewModelProtocol.swift
//  MovieFinder
//
//  Created by Arman on 1/27/25.
//

import Foundation

protocol MediaDetailViewModelProtocol: BaseViewModelProtocol {
    var detailModel: MediaDetailModel? { get set }
}

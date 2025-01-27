//
//  HomeViewModelProtocol.swift
//  MovieFinder
//
//  Created by Arman on 1/26/25.
//

import Foundation

protocol HomeViewModelProtocol: BaseViewModelProtocol {
    var mediaDataSet: HomeModel? { get set }  
    
    func doSearch(for term: String, count: Int, page: Int)
}

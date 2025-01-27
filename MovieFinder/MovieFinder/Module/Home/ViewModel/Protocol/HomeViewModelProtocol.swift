//
//  HomeViewModelProtocol.swift
//  MovieFinder
//
//  Created by Arman on 1/26/25.
//

import Foundation

protocol HomeViewModelProtocol: BaseViewModelProtocol {
    var searchedTerm: String { get set }
    var currentPage: Int { get set }
    var isFetching: Bool { get set }
    var mediaDataSet: [HomeModel.ResultItem.Group.Media.Item]? { get set }
    var castDataSet: [HomeModel.ResultItem.Group.Cast.Item]? { get set }
    
    func doSearch(for term: String, count: Int)
    func fetchNextPage()
}

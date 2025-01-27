//
//  HomeModel.swift
//  MovieFinder
//
//  Created by Arman on 1/26/25.
//

import Foundation

struct HomeModel {
    let page: Int
    let isSucceed: Bool
    let resultItems: [ResultItem]
    
    var mediaDataset: [HomeModel.ResultItem.Group.Media.Item] {
        get {
            guard let firstRes = resultItems.first else { return [] }
            if let mediaItems = firstRes.groups.media?.items {
                return mediaItems
            } else { return [] }
        }
    }
    
    var castDataset: [HomeModel.ResultItem.Group.Cast.Item] {
        get {
            guard let firstRes = resultItems.first else { return [] }
            if let mediaItems = firstRes.groups.cast?.items {
                return mediaItems
            } else { return [] }
        }
    }
}

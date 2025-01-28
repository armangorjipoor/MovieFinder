//
//  HomeViewController+TableViewDelegate.swift
//  MovieFinder
//
//  Created by Arman on 1/27/25.
//

import Foundation
import UIKit

extension HomeViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if let mediaDetailItem = vm.mediaDataSet?[indexPath.row] {
            
            coordinator.showMediaDetail(media: mediaDetailItem)
        }
    }
    
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        if let mediaDataSet = vm.mediaDataSet {
            if (indexPath.item == mediaDataSet.count - 1) {
                vm.fetchNextPage()
            }            
        }
    }
}

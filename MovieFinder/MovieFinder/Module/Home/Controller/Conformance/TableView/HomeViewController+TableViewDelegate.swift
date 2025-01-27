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
        if let mediaDetailItem = vm.mediaDataSet?.mediaDataset[indexPath.row] {
            coordinator?.showMediaDetail(media: mediaDetailItem)            
        }
    }
}

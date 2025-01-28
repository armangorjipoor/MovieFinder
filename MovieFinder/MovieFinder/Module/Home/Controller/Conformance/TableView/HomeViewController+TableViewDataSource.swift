//
//  HomeViewController+TableViewDataSource.swift
//  MovieFinder
//
//  Created by Arman on 1/27/25.
//

import Foundation
import UIKit

extension HomeViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        vm.mediaDataSet?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard let mediaItem = vm.mediaDataSet?[indexPath.row] else { return UITableViewCell() }
        
        let cell = tableView.dequeueReusableCell(withIdentifier: HomeViewControllerConstant.tableViewCellIdentifier, for: indexPath) as!
        SearchMediaCell
        cell.bind(with: mediaItem.imageUrl, text: mediaItem.name)
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        200
    }
}

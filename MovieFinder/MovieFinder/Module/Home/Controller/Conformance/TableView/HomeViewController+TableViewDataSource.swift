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
        vm.mediaDataSet?.mediaDataset.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard let mediaItem = vm.mediaDataSet?.mediaDataset[indexPath.row] else { return UITableViewCell() }
        
        let cell = tableView.dequeueReusableCell(withIdentifier: HomeViewControllerConstant.tableViewCellIdentifier, for: indexPath) as!
        SearchMediaCell
        cell.bind(with: mediaItem.imageUrl, text: mediaItem.name)
        return cell
    }
    
    
}

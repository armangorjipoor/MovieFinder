//
//  MediaDetailCoordinator.swift
//  MovieFinder
//
//  Created by Arman on 1/27/25.
//

import Foundation
import UIKit

final class MediaDetailCoordinator {
    var navigationController: UINavigationController
    private let dependencyManager = DependencyManager.shared

    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }

    func start(with media: HomeModel.ResultItem.Group.Media.Item) {
//        let castViewModel = dependencyContainer.resolve(CastDetailViewModel.self, argument: castId)
//        let castDetailViewController = CastDetailViewController(viewModel: castViewModel)
//        navigationController.pushViewController(castDetailViewController, animated: true)
    }
}

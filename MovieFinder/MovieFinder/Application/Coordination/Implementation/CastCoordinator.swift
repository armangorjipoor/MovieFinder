//
//  CastCoordinator.swift
//  MovieFinder
//
//  Created by Arman on 1/26/25.
//

import Foundation
import UIKit

final class CastDetailCoordinator {
    var navigationController: UINavigationController
    private let dependencyManager: DependencyManager

    init(navigationController: UINavigationController, dependencyManager: DependencyManager) {
        self.navigationController = navigationController
        self.dependencyManager = dependencyManager
    }

    func start(with castId: Int) {
//        let castViewModel = dependencyContainer.resolve(CastDetailViewModel.self, argument: castId)
//        let castDetailViewController = CastDetailViewController(viewModel: castViewModel)
//        navigationController.pushViewController(castDetailViewController, animated: true)
    }
}

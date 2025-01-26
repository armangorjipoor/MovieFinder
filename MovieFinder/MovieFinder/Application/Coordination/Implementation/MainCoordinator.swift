//
//  MainCoordinator.swift
//  MovieFinder
//
//  Created by Arman on 1/26/25.
//

import Foundation
import UIKit

final class MainCoordinator: CoordinatorProtocol {
    var navigationController: UINavigationController
    private let dependencyManager: DependencyManagerProtocol

    init(navigationController: UINavigationController, dependencyManager: DependencyManagerProtocol) {
        self.navigationController = navigationController
        self.dependencyManager = dependencyManager
    }

    func start() {
//        let mainViewModel = dependencyManager.resolve(MainViewModel.self)
//        let mainViewController = MainViewController(viewModel: mainViewModel)
//        mainViewController.coordinator = self
//        navigationController.pushViewController(mainViewController, animated: true)
    }

    func showCastDetail(castId: Int) {
//        let castCoordinator = CastDetailCoordinator(
//            navigationController: navigationController,
//            dependencyManager: dependencyManager
//        )
//        castCoordinator.start(with: castId)
    }
}

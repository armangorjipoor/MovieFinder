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
        let homeViewController = HomeViewController(vm: dependencyManager.resolve(type: HomeViewModelProtocol.self, arguments: []))
        homeViewController.coordinator = self
        navigationController.pushViewController(homeViewController, animated: true)
    }

    func showMediaDetail(media: HomeModel.ResultItem.Group.Media.Item) {
        let mediaCoordinator = MediaDetailCoordinator(navigationController: navigationController)
        mediaCoordinator.start(with: media)
    }
    
    func showCastDetail(castId: Int) {
//        let castCoordinator = CastDetailCoordinator(
//            navigationController: navigationController,
//            dependencyManager: dependencyManager
//        )
//        castCoordinator.start(with: castId)
    }
}

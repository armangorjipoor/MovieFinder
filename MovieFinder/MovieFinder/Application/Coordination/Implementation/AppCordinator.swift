//
//  AppCordinator.swift
//  MovieFinder
//
//  Created by Arman on 1/26/25.
//

import Foundation
import UIKit

final class AppCoordinator: CoordinatorProtocol {
    var navigationController: UINavigationController
    private let dependencyManager = DependencyManager.shared

    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }

    func start() {
        let mainCoordinator = MainCoordinator(
            navigationController: navigationController,
            dependencyManager: dependencyManager
        )
        
        mainCoordinator.start()
    }
}

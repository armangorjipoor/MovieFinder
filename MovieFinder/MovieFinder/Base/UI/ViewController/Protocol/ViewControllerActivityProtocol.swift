//
//  ViewControllerActivityProtocol.swift
//  MovieFinder
//
//  Created by Arman on 1/26/25.
//

import Foundation
import UIKit

@objc
protocol ViewControllerActivityProtocol where Self: UIViewController {
    @objc func showApplicationActivity(animated: Bool, completion: (() -> ())?)
    @objc func hideApplicationActivity(animated: Bool, completion: (() -> ())?)
}

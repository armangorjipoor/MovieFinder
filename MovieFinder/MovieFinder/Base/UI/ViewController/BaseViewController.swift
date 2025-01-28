//
//  BaseViewController.swift
//  MovieFinder
//
//  Created by Arman on 1/26/25.
//

import Foundation
import UIKit
import Combine

class BaseViewController: UIViewController {
    
    public var cancellable: AnyCancellable?
    public var cancellables = Set<AnyCancellable>()
    
    init() {
        super.init(nibName: nil, bundle: nil)
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override var preferredStatusBarStyle: UIStatusBarStyle { .default }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    open override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    }
    
    @available(*, unavailable)
    func showActivityLoading(animated: Bool) {
        // To be implemented
    }
    
    @available(*, unavailable)
    func hidePageLoading(animated: Bool) {
        // To be implemented
    }
    
    func showAlert(withMessage message: String) {
        // Create the alert controller
        let alertController = UIAlertController(title: "Error", message: message, preferredStyle: .alert)
        
        // Add the OK button
        let okAction = UIAlertAction(title: "OK", style: .default, handler: nil)
        alertController.addAction(okAction)
        
        // Present the alert on the given view controller
        self.present(alertController, animated: true, completion: nil)
    }
    
    deinit {
        cancellable = nil
    }
}


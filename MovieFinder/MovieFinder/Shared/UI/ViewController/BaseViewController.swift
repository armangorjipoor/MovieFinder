//
//  BaseViewController.swift
//  MovieFinder
//
//  Created by Arman on 1/26/25.
//

import Foundation
import UIKit
import Combine

class Base: UIViewController {
    
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
    
    deinit {
        // Combine subscriptions automatically cancel on deallocation,
        // so no need to manually handle it unless using `AnyCancellable?`.
        cancellable = nil
    }
}


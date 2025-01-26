//
//  ViewControllerWithViewModelSupportProtocol.swift
//  MovieFinder
//
//  Created by Arman on 1/26/25.
//

import Foundation
import Combine
import UIKit

protocol ViewControllerWithViewModelSupportProtocol where Self: UIViewController & ViewControllerActivityProtocol {
    func loading(animated: Bool, inner: Bool)
    func handleError(error: NSError)
    func bindViewModelStatus(vm: BaseViewModelProtocol)
    func refreshing()
    func submitted()
    func loaded()
    
    var cancellables: Set<AnyCancellable> { get set }
}

extension ViewControllerWithViewModelSupportProtocol {
    
    func bindViewModelStatus(vm: BaseViewModelProtocol) {
        vm.statusPublisher
            .receive(on: DispatchQueue.main) // Replace `observeOn(MainScheduler.instance)` with Combine equivalent
            .sink { [weak self] status in
                guard let self = self else { return }
                switch status {
                case .loading:
                    self.loading()
                case .loaded:
                    self.loaded()
                case .error(let error):
                    self.handleError(error: error)
                case .none:
                    break
                }
            }
            .store(in: &cancellables) // Use Combine's `store(in:)` to manage the subscription
    }
    
    func loading() {
//        showApplicationPageLoading(animated: animated, inner: inner, completion: nil)
    }
    
    func loaded() {
//        hideApplicationPageLoading(animated: true, completion: nil)
    }
    
    func handleError(error: NSError) {
//        NZTopAlert.present(with: NZTopAlertModeError, text: error.localizedDescription)
//        hideApplicationPageLoading(animated: true, completion: nil)
    }
    
    func refreshing() {
        // Add any required implementation
    }
    
    func submitted() {
        // Add any required implementation
    }
}

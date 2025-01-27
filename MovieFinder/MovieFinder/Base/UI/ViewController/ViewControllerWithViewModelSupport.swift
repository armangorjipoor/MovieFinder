//
//  ViewControllerWithViewModelSupport.swift
//  MovieFinder
//
//  Created by Arman on 1/26/25.
//

import Foundation


class ViewControllerWithViewModelSupport: BaseViewController, ViewControllerWithViewModelSupportProtocol {
    
    private var vm: BaseViewModelProtocol?

    
    func bindViewModelStatus(vm: BaseViewModelProtocol) {
        self.vm = vm
        vm.statusPublisher
            .receive(on: DispatchQueue.main) // Observing on the main thread
            .sink { [unowned self] status in
                switch status {
                case .loading:
                    loading()
                case .loaded:
                    loaded()
                case .error(let error):
                    handleError(error: error)
                case .none:
                    return
                }
            }
            .store(in: &cancellables) // Storing the subscription
    }
    
    open func loading() {
    }
    
    open func loaded() {
    }
    
    open func handleError(error: NSError) {
    }
    
    func showApplicationActivity(animated: Bool, completion: (() -> ())?) {
        
    }
    
    func hideApplicationActivity(animated: Bool, completion: (() -> ())?) {
        
    }
    open func refreshing() {
        
    }
    

}


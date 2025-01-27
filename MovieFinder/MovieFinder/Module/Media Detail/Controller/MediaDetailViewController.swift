//
//  MediaDetailViewController.swift
//  MovieFinder
//
//  Created by Arman on 1/27/25.
//

import Foundation

import UIKit

enum MediaDetailViewControllerConstant {
    static let tableViewCellIdentifier = "HomeTableViewCell"
    static let collectionViewCellIdentifier = "CollectionViewCellIdentifier"
    static let searchLimitCharacter = 2
    static let searchDelay = 2000
    static let subviewsSideDistance: CGFloat = 20.0
    static let desiredResultItemsCount: Int = 99
}

class MediaDetailViewController: ViewControllerWithViewModelSupport {

    
    var vm: MediaDetailViewModelProtocol
    init(vm: MediaDetailViewModelProtocol) {
        self.vm = vm
        super.init()
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .lightGray
        bindViewModelStatus(vm: vm)
  
        vm.loadData()
        
        addConstraint()
    }
    
    
    func addConstraint() {

//        view.addSubview()
        NSLayoutConstraint.activate([
           
        ])
        
      
    }


    override func loaded() {
//        hideApplicationPageLoading(animated: true, completion: nil)
    }
    
    override func handleError(error: NSError) {
//        hideApplicationPageLoading(animated: true, completion: nil)
//
//        showRetryView(retryHandler: { [weak self] in
//            guard let weak = self else { return }
//            weak.vm.loadData(first: false)
//        })
    }

}

//
//  MediaListViewController.swift
//  MovieFinder
//
//  Created by Arman on 1/26/25.
//

import Foundation
import UIKit

class HomeViewController: ViewControllerWithViewModelSupport {
   
    lazy var table: UITableView = {
        let view = UITableView()
        view.delegate = self
        view.dataSource = self
        view.register(UI.Address.List.Cell.self, forCellReuseIdentifier: UI.Address.List.Cell.reuseIdentifier())
        view.setupEmptyDataset(datasource: self, delegate: self)
        view.showsVerticalScrollIndicator = false
        return view
    }()

    var vm: AddressViewModelProtocol
    
    init(vm: AddressViewModelProtocol) {
        self.vm = vm
        super.init()
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        bindViewModelStatus(vm: vm)
        vm.loadData(first: true)
        addConstraint()
    }
    
    func addConstraint() {
        view.addSubview(table)
        
        table
        table
        table
    }

    override func loaded() {
//        hideApplicationPageLoading(animated: true, completion: nil)
        table.reloadData()
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

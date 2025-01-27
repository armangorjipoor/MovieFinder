//
//  MediaListViewController.swift
//  MovieFinder
//
//  Created by Arman on 1/26/25.
//

import Foundation
import UIKit

enum HomeViewControllerConstant {
    static let tableViewCellIdentifier = "HomeTableViewCell"
    static let collectionViewCellIdentifier = "CollectionViewCellIdentifier"
}
class HomeViewController: ViewControllerWithViewModelSupport {
   
    lazy var table: UITableView = {
        let view = UITableView()
//        view.delegate = self
//        view.dataSource = self
//        view.register(UI.Address.List.Cell.self, forCellReuseIdentifier: UI.Address.List.Cell.reuseIdentifier())
        view.showsVerticalScrollIndicator = false
        return view
    }()

    private lazy var btn: UIButton  = {
        let view = UIButton()
        view.backgroundColor = .blue
        view.setTitle("Tap me", for: .normal)
        view.widthAnchor.constraint(equalToConstant: 100).isActive = true
        view.heightAnchor.constraint(equalToConstant: 100).isActive = true
        view.addTarget(self, action: #selector(btnTap), for: .touchUpInside)
        return view
    }()
    
    var vm: HomeViewModelProtocol
    init(vm: HomeViewModelProtocol) {
        self.vm = vm
        super.init()
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .green
        bindViewModelStatus(vm: vm)
        vm.loadData()
        addConstraint()
    }
    
    func addConstraint() {
        view.addSubview(table)
        view.addSubview(btn)
        btn.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        btn.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        table
        table
        table
    }

    @objc func btnTap() {
        vm.loadData()
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

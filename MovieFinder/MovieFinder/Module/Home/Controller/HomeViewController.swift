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
    static let searchLimitCharacter = 2
    static let searchDelay = 2000
    static let subviewsSideDistance: CGFloat = 20.0
    static let desiredResultItemsCount: Int = 4
}

class HomeViewController: ViewControllerWithViewModelSupport {
   
    private lazy var searchField: UITextField  = {
        let view = UITextField()
        view.delegate = self
        view.borderStyle = .roundedRect
        view.backgroundColor = .lightGray
        view.textAlignment = .left
        view.heightAnchor.constraint(equalToConstant: 40).isActive = true
        view.placeholder = "فیلم، سریال، بازیگر"
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private lazy var emptyView: EmptyView  = {
        let view = EmptyView()
        view.isHidden = true
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private lazy var castCollectionView: UICollectionView  = {
        let view = UICollectionView(frame: .zero, collectionViewLayout: UICollectionViewFlowLayout())
        return view
    }()
    
    lazy var resultTableView: UITableView = {
        let view = UITableView()
        view.delegate = self
        view.dataSource = self
        view.register(SearchMediaCell.self, forCellReuseIdentifier: HomeViewControllerConstant.tableViewCellIdentifier)
        view.showsVerticalScrollIndicator = false
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()

    var coordinator: MainCoordinator
    var vm: HomeViewModelProtocol
    init(vm: HomeViewModelProtocol, coordinator: MainCoordinator) {
        self.vm = vm
        self.coordinator = coordinator
        
        super.init()
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        bindViewModelStatus(vm: vm)
        
        NotificationCenter.default.publisher(for: UITextField.textDidChangeNotification, object: searchField)
                    .compactMap { ($0.object as? UITextField)?.text }
                    .debounce(for: .milliseconds(HomeViewControllerConstant.searchDelay), scheduler: RunLoop.main)
                    .removeDuplicates()
                    .sink { [weak self] debouncedText in
                        guard let weakSelf = self else { return }
                        weakSelf.performSearch(for: debouncedText)
                    }
                    .store(in: &cancellables)
        addConstraint()
    }
    
    
    func addConstraint() {
        view.addSubview(searchField)
        NSLayoutConstraint.activate([
            searchField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: HomeViewControllerConstant.subviewsSideDistance),
            searchField.trailingAnchor.constraint(equalTo: view.trailingAnchor,
                                                  constant:  -HomeViewControllerConstant.subviewsSideDistance),
            searchField.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 5)
        ])
        
        view.addSubview(resultTableView)
        NSLayoutConstraint.activate([
            resultTableView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: HomeViewControllerConstant.subviewsSideDistance),
            resultTableView.trailingAnchor.constraint(equalTo: view.trailingAnchor,
                                                      constant:  -HomeViewControllerConstant.subviewsSideDistance),
            resultTableView.topAnchor.constraint(equalTo: searchField.bottomAnchor, constant: 10),
            resultTableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: 20)
        ])
        
        view.addSubview(emptyView)
        NSLayoutConstraint.activate([
            emptyView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: HomeViewControllerConstant.subviewsSideDistance),
            emptyView.trailingAnchor.constraint(equalTo: view.trailingAnchor,
                                                      constant:  -HomeViewControllerConstant.subviewsSideDistance),
            emptyView.topAnchor.constraint(equalTo: searchField.bottomAnchor, constant: 10),
            emptyView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: 20)
        ])
    }

    private func performSearch(for term: String) {
        if term.count > HomeViewControllerConstant.searchLimitCharacter {
            print("\(term)")
            vm.doSearch(for: term, count: HomeViewControllerConstant.desiredResultItemsCount)
        }
    }
 
    override func loaded() {
//        hideApplicationPageLoading()
        if let anyItem = vm.mediaDataSet {
            if anyItem.isEmpty {
                emptyView.isHidden = false
            } else {
                emptyView.isHidden = true
            }
        } else {
            emptyView.isHidden = false
        }
        resultTableView.reloadData()
    }
    
    override func handleError(error: NSError) {
//        hideApplicationPageLoading(animated: true, completion: nil)
//        
        showAlert(withMessage: "خطایی پیش آمده است")
    }

}

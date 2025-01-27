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
    static let desiredResultItemsCount: Int = 99
}

class HomeViewController: ViewControllerWithViewModelSupport {
   
    private lazy var searchField: UITextField  = {
        let view = UITextField()
        view.delegate = self
        view.borderStyle = .roundedRect
        view.backgroundColor = .white
        view.textAlignment = .left
        view.heightAnchor.constraint(equalToConstant: 40).isActive = true
        view.placeholder = "فیلم، سریال، بازیگر"
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

    weak var coordinator: MainCoordinator?
    
    var vm: HomeViewModelProtocol
    init(vm: HomeViewModelProtocol) {
        self.vm = vm
        super.init()
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .lightGray
        bindViewModelStatus(vm: vm)
        
        NotificationCenter.default.publisher(for: UITextField.textDidChangeNotification, object: searchField)
                    .compactMap { ($0.object as? UITextField)?.text } // Extract text from notification
                    .debounce(for: .milliseconds(HomeViewControllerConstant.searchDelay), scheduler: RunLoop.main) // Debounce for 500ms
                    .removeDuplicates() // Avoid repeating the same value
                    .sink { [weak self] debouncedText in
                        guard let weakSelf = self else { return }
                        weakSelf.performSearch(for: debouncedText)
                    }
                    .store(in: &cancellables)
        vm.loadData()
        
        addConstraint()
    }
    
    
    func addConstraint() {
        view.addSubview(searchField)
        NSLayoutConstraint.activate([
            searchField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: HomeViewControllerConstant.subviewsSideDistance),
            searchField.trailingAnchor.constraint(equalTo: view.trailingAnchor,
                                                  constant:  -HomeViewControllerConstant.subviewsSideDistance),
            searchField.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20)
        ])
        
        view.addSubview(resultTableView)
        NSLayoutConstraint.activate([
            resultTableView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: HomeViewControllerConstant.subviewsSideDistance),
            resultTableView.trailingAnchor.constraint(equalTo: view.trailingAnchor,
                                                      constant:  -HomeViewControllerConstant.subviewsSideDistance),
            resultTableView.topAnchor.constraint(equalTo: searchField.bottomAnchor, constant: 10),
            resultTableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: 20)
        ])
        
      
    }

    private func performSearch(for term: String) {
        if term.count > HomeViewControllerConstant.searchLimitCharacter {
            print("\(term)")
            vm.doSearch(for: term, count: HomeViewControllerConstant.desiredResultItemsCount, page: 1)
        }
    }
 
    override func loaded() {
//        hideApplicationPageLoading(animated: true, completion: nil)
        resultTableView.reloadData()
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

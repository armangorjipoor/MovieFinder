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
}

class HomeViewController: ViewControllerWithViewModelSupport {
   
    private lazy var searchField: UITextField  = {
        let view = UITextField()
        view.delegate = self
        view.borderStyle = .roundedRect
        view.backgroundColor = .white
        view.textAlignment = .left
        view.heightAnchor.constraint(equalToConstant: 40).isActive = true
        view.addTarget(self, action: #selector(searchFieldDidChange), for: .editingChanged)
        view.placeholder = "فیلم، سریال، بازیگر"
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private lazy var castCollectionView: UICollectionView  = {
        let view = UICollectionView(frame: .zero, collectionViewLayout: UICollectionViewFlowLayout())
        return view
    }()
    
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
        view.addSubview(table)
      
    }

    private func performSearch(for term: String) {
        if term.count > HomeViewControllerConstant.searchLimitCharacter {
            print("\(term)")
            vm.doSearch(for: term, count: 20, page: 1)
        }
    }
    
    
    @objc func searchFieldDidChange(field: UITextField) {
        guard let searchText = field.text else { return }
        if searchText.count > HomeViewControllerConstant.searchLimitCharacter {
            //begin test
        }
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

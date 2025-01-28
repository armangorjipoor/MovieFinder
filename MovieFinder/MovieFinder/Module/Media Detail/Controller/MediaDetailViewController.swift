//
//  MediaDetailViewController.swift
//  MovieFinder
//
//  Created by Arman on 1/27/25.
//

import Foundation

import UIKit

enum MediaDetailViewControllerConstant {
    static let mainImageHeight: CGFloat = 200
    static let subviewsSideDistance: CGFloat = 10.0
}

class MediaDetailViewController: ViewControllerWithViewModelSupport {

    private let imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        imageView.clipsToBounds = true
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.heightAnchor.constraint(equalToConstant: MediaDetailViewControllerConstant.mainImageHeight).isActive = true
        return imageView
    }()
    
    private let mediaTitleLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 16, weight: .medium)
        label.numberOfLines = 0
        label.textColor = .label
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let mediaDescriptionLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 12, weight: .medium)
        label.numberOfLines = 0
        label.textColor = .label
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    lazy var scrollView: UIScrollView  = {
        let view = UIScrollView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.showsVerticalScrollIndicator = true
        view.showsHorizontalScrollIndicator = false
        view.isDirectionalLockEnabled = true
        view.alwaysBounceHorizontal = false
        return view
    }()
    
    var vm: MediaDetailViewModelProtocol
    init(vm: MediaDetailViewModelProtocol) {
        self.vm = vm
        super.init()
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        bindViewModelStatus(vm: vm)
  
        vm.loadData()
        
        addConstraint()
    }
    
    
    func addConstraint() {
        
        view.addSubview(scrollView)
        NSLayoutConstraint.activate([
            scrollView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            scrollView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            scrollView.topAnchor.constraint(equalTo: view.topAnchor, constant: 20),
            scrollView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
        
        scrollView.addSubview(imageView)
        NSLayoutConstraint.activate([
            imageView.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor, constant: 0),
            imageView.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor),
            imageView.topAnchor.constraint(equalTo: scrollView.topAnchor)
        ])
        
        scrollView.addSubview(mediaTitleLabel)
        NSLayoutConstraint.activate([
            mediaTitleLabel.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor, constant: MediaDetailViewControllerConstant.subviewsSideDistance),
            mediaTitleLabel.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor, constant: -MediaDetailViewControllerConstant.subviewsSideDistance),
            mediaTitleLabel.topAnchor.constraint(equalTo: imageView.bottomAnchor, constant: MediaDetailViewControllerConstant.subviewsSideDistance)
        ])
        
        scrollView.addSubview(mediaDescriptionLabel)
        NSLayoutConstraint.activate([
            mediaDescriptionLabel.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor, constant: MediaDetailViewControllerConstant.subviewsSideDistance),
            mediaDescriptionLabel.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor, constant: -MediaDetailViewControllerConstant.subviewsSideDistance),
            mediaDescriptionLabel.topAnchor.constraint(equalTo: mediaTitleLabel.bottomAnchor, constant: MediaDetailViewControllerConstant.subviewsSideDistance),
            mediaDescriptionLabel.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor)
        ])
    }


    override func loaded() {
//        hideApplicationPageLoading()
        if let model = vm.detailModel {
            
            imageView.loadImage(from: MediaDetailRoute.relativeImageUrl.rawValue + model.imageUrl)
            mediaTitleLabel.text = model.caption
            mediaDescriptionLabel.text = model.teaserText
        }
    }
    
    override func handleError(error: NSError) {

    }

}

//
//  EmptyView.swift
//  MovieFinder
//
//  Created by Arman on 1/27/25.
//

import Foundation
import UIKit

class EmptyView: UIView {
    private lazy var descriptionLabel: UILabel  = {
        let view = UILabel()
        view.text = "موردی برای نمایش وجود ندارد"
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        addSubview(descriptionLabel)
        descriptionLabel.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
        descriptionLabel.centerYAnchor.constraint(equalTo: self.centerYAnchor).isActive = true
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

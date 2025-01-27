//
//  SearchMediaCell.swift
//  MovieFinder
//
//  Created by Arman on 1/27/25.
//

import Foundation
import UIKit

class SearchMediaCell: UITableViewCell {
    
    private let mediaImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        imageView.layer.cornerRadius = 8
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    private let mediaLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 16, weight: .medium)
        label.numberOfLines = 0
        label.textColor = .label
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        contentView.addSubview(mediaImageView)
        contentView.addSubview(mediaLabel)
        
        NSLayoutConstraint.activate([
            mediaImageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 10),
            mediaImageView.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            mediaImageView.widthAnchor.constraint(equalToConstant: 100),
            mediaImageView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: -10),
            mediaImageView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -10),
            
            mediaLabel.leadingAnchor.constraint(equalTo: mediaImageView.trailingAnchor, constant: 10),
            mediaLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -10),
            mediaLabel.centerYAnchor.constraint(equalTo: contentView.centerYAnchor)
        ])
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func bind(with imageUrl: String, text: String) {
        mediaLabel.text = text
        mediaImageView.loadImage(from: imageUrl)
    }

}
 

//
//  SearchMediaCell.swift
//  MovieFinder
//
//  Created by Arman on 1/27/25.
//

import Foundation
import UIKit

class SearchMediaCell: UITableViewCell {
    
    private let customImageView: UIImageView = {
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
        
        contentView.addSubview(customImageView)
        contentView.addSubview(mediaLabel)
        
        NSLayoutConstraint.activate([
            customImageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 10),
            customImageView.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            customImageView.widthAnchor.constraint(equalToConstant: 60),
            customImageView.heightAnchor.constraint(equalToConstant: 60),
            
            mediaLabel.leadingAnchor.constraint(equalTo: customImageView.trailingAnchor, constant: 10),
            mediaLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -10),
            mediaLabel.centerYAnchor.constraint(equalTo: contentView.centerYAnchor)
        ])
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func bind(with imageUrl: String, text: String) {
        mediaLabel.text = text
        loadImage(from: imageUrl)
    }
    
    private func loadImage(from urlString: String) {
        guard let url = URL(string: urlString) else {
            self.customImageView.image = UIImage(systemName: "photo") // Placeholder image
            return
        }
        
        URLSession.shared.dataTask(with: url) { [weak self] data, _, error in
            guard let self = self, let data = data, error == nil else {
                DispatchQueue.main.async {
                    self?.customImageView.image = UIImage(systemName: "photo") // Placeholder image
                }
                return
            }
            let image = UIImage(data: data)
            DispatchQueue.main.async {
                self.customImageView.image = image
            }
        }.resume()
    }
}
 

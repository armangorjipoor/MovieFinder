//
//  UIImageView+imageLoad.swift
//  MovieFinder
//
//  Created by Arman on 1/27/25.
//

import Foundation
import UIKit

extension UIImageView {
    func loadImage(from urlString: String, placeholder: UIImage? = UIImage(systemName: "photo")) {
        self.image = placeholder 
        
        guard let url = URL(string: urlString) else {
            return
        }
        
        URLSession.shared.dataTask(with: url) { [weak self] data, _, error in
            guard let self = self, let data = data, error == nil else {
                return
            }
            let image = UIImage(data: data)
            DispatchQueue.main.async {
                self.image = image
            }
        }.resume()
    }
}

//
//  UIImageView+Extensions.swift
//  MyDay
//
//  Created by Danny Huang on 8/23/21.
//

import UIKit

extension UIImageView {
    func downloaded(from url: URL, contentMode mode: ContentMode = .scaleAspectFit, alignmentRectInsets insets: UIEdgeInsets = .zero) {
        contentMode = mode
        URLSession.shared.dataTask(with: url) { data, response, error in
            guard
                let httpURLResponse = response as? HTTPURLResponse, httpURLResponse.statusCode == 200,
                let mimeType = response?.mimeType, mimeType.hasPrefix("image"),
                let data = data, error == nil,
                let image = UIImage(data: data)?.withAlignmentRectInsets(insets)
                else { return }
            DispatchQueue.main.async() { [weak self] in
                self?.image = image
            }
        }.resume()
    }
    func downloaded(from link: String, contentMode mode: ContentMode = .scaleAspectFit, alignmentRectInsets insets: UIEdgeInsets = .zero) {
        guard let url = URL(string: link) else { return }
        downloaded(from: url, contentMode: mode, alignmentRectInsets: insets)
    }
}

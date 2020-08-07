//
//  UIImageView+Extensions.swift
//  ImgurImagesVIPER
//
//  Created by Isaac Sanchez on 04/08/20.
//  Copyright © 2020 Isaac Sanchez. All rights reserved.
//

import UIKit

extension UIImageView {
    
    func download(from url: URL) {
        contentMode = UIView.ContentMode.scaleAspectFit
        URLSession.shared.dataTask(with: url) { data, response, error in
            guard let httpURLResponse = response as? HTTPURLResponse, httpURLResponse.statusCode == 200,
                let mimeType = response?.mimeType, mimeType.hasPrefix("image"),
                let data = data, error == nil,
                let image = UIImage(data: data)
                else { return }
            
            DispatchQueue.main.async() { [weak self] in
                self?.image = image
            }
            
        }.resume()
    }
    
}
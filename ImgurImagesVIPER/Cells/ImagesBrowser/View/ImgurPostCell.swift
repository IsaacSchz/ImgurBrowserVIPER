//
//  ImgurPostCell.swift
//  ImgurImagesVIPER
//
//  Created by Isaac Sanchez on 04/08/20.
//  Copyright © 2020 Isaac Sanchez. All rights reserved.
//

import UIKit

class ImgurPostCell: UITableViewCell {
    
    // MARK: - IBOUTLETS
    
    @IBOutlet weak var postImage: UIImageView?
    @IBOutlet weak var hConstraint: NSLayoutConstraint!
    
    var imageData: Data? {
        didSet {
            DispatchQueue.main.async { [weak self] in
                guard let data = self?.imageData else { return }
                self?.postImage?.image = UIImage(data: data)
            }
        }
    }

    
    // MARK: - VIEW
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func prepareForReuse() {
        super.prepareForReuse()
        postImage?.image = nil
        hConstraint.constant = 218
    }

}

extension ImgurPostCell: ImgurPostCellViewProtocol {

}

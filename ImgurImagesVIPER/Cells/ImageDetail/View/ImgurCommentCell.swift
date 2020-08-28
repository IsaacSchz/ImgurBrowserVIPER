//
//  ImgurCommentCell.swift
//  ImgurImagesVIPER
//
//  Created by Isaac Sanchez on 04/08/20.
//  Copyright © 2020 Isaac Sanchez. All rights reserved.
//

import UIKit

class ImgurCommentCell: UITableViewCell {
    
    @IBOutlet weak var commentLabel: UILabel?
    
    var commentText: String? {
        didSet {
            DispatchQueue.main.async { [weak self] in
                guard let text = self?.commentText else { return }
                self?.commentLabel?.text = text
            }
        }
    }

    
    // MARK: - VIEW
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
    }
}

extension ImgurCommentCell: ImgurCommentCellViewProtocol {
    
}

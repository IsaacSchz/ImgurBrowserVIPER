//
//  ImgurCommentCellProtocols.swift
//  ImgurImagesVIPER
//
//  Created by Isaac Sanchez on 17/08/20.
//  Copyright © 2020 Isaac Sanchez. All rights reserved.
//

import Foundation


protocol ImgurCommentCellViewProtocol: class {
    
    var commentText: String? { get set }
    
}

protocol ImgurCommentCellPresenterProtocol: class {
         
    func updateComment()
    
}

protocol ImgurCommentCellInteractorProtocol: class {
    
}

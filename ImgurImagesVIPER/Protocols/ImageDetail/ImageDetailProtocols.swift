//
//  ImageDetailProtocols.swift
//  ImgurImagesVIPER
//
//  Created by Isaac Sanchez on 04/08/20.
//  Copyright © 2020 Isaac Sanchez. All rights reserved.
//

import Foundation

protocol ImageDetailViewProtocol {
    
    // MARK: - VARIABLES
    
    var detailedImage: DetailedImagePresenter? { get set }
    var comments: [ImgurCommentCellPresenter]? { get set }
    
    
    // MARK: - FUNCTIONS
    
    func showNoCommentsView()
    func showNetworkingError()
    
}

protocol ImageDetailPresenterProtocol {
    
    // MARK: - FUNCTIONS
    
    func updateImageDetail(with postId: String, imageURL: URL?)
    
}

protocol ImageDetailInteractorProtocol {
    func fetchComments(forId postId: String, completion: @escaping (Result<[ImgurComment], ServiceConstants.NetworkingError>) -> Void)
}

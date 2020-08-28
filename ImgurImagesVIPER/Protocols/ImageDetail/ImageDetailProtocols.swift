//
//  ImageDetailProtocols.swift
//  ImgurImagesVIPER
//
//  Created by Isaac Sanchez on 04/08/20.
//  Copyright © 2020 Isaac Sanchez. All rights reserved.
//

import Foundation

protocol ImageDetailViewProtocol: class {
    
    // MARK: - VARIABLES
    
    var comments: [ImgurCommentCellPresenter]? { get set }
    
    
    // MARK: - FUNCTIONS
    
    func showNoCommentsView()
    func showNetworkingError()
    
}

protocol ImageDetailPresenterProtocol: class {
    
    // MARK: - FUNCTIONS
    
    func updateComments(with postId: String)
    
}

protocol ImageDetailInteractorProtocol: class {
    
    func fetchComments(forId postId: String, completion: @escaping (Result<[ImgurComment], ServiceConstants.NetworkingError>) -> Void)
    
}

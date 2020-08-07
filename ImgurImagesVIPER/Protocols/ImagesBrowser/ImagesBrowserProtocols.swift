//
//  ImagesBrowserProtocols.swift
//  ImgurImagesVIPER
//
//  Created by Isaac Sanchez on 04/08/20.
//  Copyright © 2020 Isaac Sanchez. All rights reserved.
//

import Foundation

protocol ImagesBrowserViewProtocol {
    
    // MARK: - VARIABLES
    var posts: [ImgurPostCellPresenter]? { get set }
    
    
    // MARK: - FUNCTIONS
    
    func showNetworkingError()
    
}

protocol ImagesBrowserPresenterProtocol {
    
    // MARK: - FUNCTIONS
    
    func updatePosts(with keyword: String)
    
}

protocol ImagesBrowserInteractorProtocol {
    
    func fetchPosts(by keyword: String, completion: @escaping (Result<[ImgurPost], ServiceConstants.NetworkingError>) -> Void)
    
}

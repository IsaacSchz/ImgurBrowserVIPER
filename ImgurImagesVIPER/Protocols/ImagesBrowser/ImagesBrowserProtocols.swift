//
//  ImagesBrowserProtocols.swift
//  ImgurImagesVIPER
//
//  Created by Isaac Sanchez on 04/08/20.
//  Copyright © 2020 Isaac Sanchez. All rights reserved.
//

import Foundation

protocol ImagesBrowserViewProtocol: class {
    
    // MARK: - VARIABLES
    var posts: [ImgurPostCellPresenter]? { get set }
    
    
    // MARK: - FUNCTIONS
    
    func showNetworkingError()
    
}

protocol ImagesBrowserPresenterProtocol: class {
    
    // MARK: - FUNCTIONS
    
    func updatePosts(with keyword: String)

}

protocol ImagesBrowserInteractorProtocol: class {
    
    func fetchPosts(by keyword: String, completion: @escaping (Result<[ImgurPost], ServiceConstants.NetworkingError>) -> Void)
    
}

//
//  ImageBrowserServiceProtocols.swift
//  ImgurImagesVIPER
//
//  Created by Isaac Sanchez on 04/08/20.
//  Copyright © 2020 Isaac Sanchez. All rights reserved.
//

protocol ImagesBrowserRequestManagerProtocol {
    
    func fetchPosts(
        by keyword: String,
        with session: URLSessionProtocol,
        success: @escaping ([ImgurPost]) -> Void,
        failure: @escaping (ServiceConstants.NetworkingError) -> Void)
    
}

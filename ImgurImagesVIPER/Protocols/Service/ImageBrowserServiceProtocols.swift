//
//  ImageBrowserServiceProtocols.swift
//  ImgurImagesVIPER
//
//  Created by Isaac Sanchez on 04/08/20.
//  Copyright © 2020 Isaac Sanchez. All rights reserved.
//

import Foundation

protocol ImagesBrowserRequestManagerProtocol: class {
    
    func fetchPosts(
        by keyword: String,
        with session: URLSessionProtocol,
        success: @escaping ([ImgurPost]) -> Void,
        failure: @escaping (ServiceConstants.NetworkingError) -> Void)
    
    func downloadImage(
        with url: URL,
        with session: URLSessionProtocol,
        success: @escaping (Data) -> Void,
        failure: @escaping (ServiceConstants.NetworkingError) -> Void)
    
}

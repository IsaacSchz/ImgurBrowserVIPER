//
//  ImageDetailServiceProtocols.swift
//  ImgurImagesVIPER
//
//  Created by Isaac Sanchez on 04/08/20.
//  Copyright © 2020 Isaac Sanchez. All rights reserved.
//

protocol ImageDetailRequestManagerProtocol: class {
    
    func fetchComments(
        forId postId: String,
        with session: URLSessionProtocol,
        success: @escaping ([ImgurComment]) -> Void,
        failure: @escaping (ServiceConstants.NetworkingError) -> Void)
    
}

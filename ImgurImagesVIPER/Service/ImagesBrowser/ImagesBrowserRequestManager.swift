//
//  ImagesBrowserRequestManager.swift
//  ImgurImagesVIPER
//
//  Created by Isaac Sanchez on 04/08/20.
//  Copyright © 2020 Isaac Sanchez. All rights reserved.
//

import Foundation

class ImagesBrowserRequestManager: ImagesBrowserRequestManagerProtocol {

    /// - Parameters:
    ///   - keyword: The word to be searched
    ///   - session: The URLSession
    ///   - success: The success complition handler
    ///   - failure: The failure complition handler
    func fetchPosts (
        by keyword: String,
        with session: URLSessionProtocol = URLSession.shared,
        success: @escaping ([ImgurPost]) -> Void,
        failure: @escaping (ServiceConstants.NetworkingError) -> Void) {
        
        guard let url = URL(string: ImgurRequest(keyword).urlString) else { return }
        var urlRequest = URLRequest(url: url)
        urlRequest.setValue("Client-ID \(ServiceConstants.clientId)", forHTTPHeaderField: "Authorization")
        
        NetworkManager.pullData(with: session, request: urlRequest,
                         success: { (responseData: Data, _) in
                            do {
                                let jsonDecoder = JSONDecoder()
                                let result = try jsonDecoder.decode(ImgurResponse.self, from: responseData)
                                success(result.posts ?? [])
                                
                            } catch {
                                failure(ServiceConstants.NetworkingError.invalidData)
                            } },

                         failure: { error in
                            failure(error)
        })
    }
    
    /// - Parameters:
    ///   - url:     The image URL
    ///   - session: The URLSession
    ///   - success: The success complition handler
    ///   - failure: The failure complition handler
    func downloadImage(
        with url: URL,
        with session: URLSessionProtocol,
        success: @escaping (Data) -> Void,
        failure: @escaping (ServiceConstants.NetworkingError) -> Void) {

        let urlRequest = URLRequest(url: url)
        NetworkManager.pullData(with: session, request: urlRequest,
                        success: { (responseData: Data, response) in
                            guard response.statusCode == 200, let mimeType = response.mimeType, mimeType.hasPrefix("image") else { return }
                            success(responseData) },

                        failure: { error in
                            failure(error)
                        })
    }

}

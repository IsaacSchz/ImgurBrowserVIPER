//
//  ImagesBrowserRequestManager.swift
//  ImgurImagesVIPER
//
//  Created by Isaac Sanchez on 04/08/20.
//  Copyright © 2020 Isaac Sanchez. All rights reserved.
//

import Foundation

struct ImagesBrowserRequestManager: ImagesBrowserRequestManagerProtocol {
    
    /// - Parameters:
    ///   - session: The URLSession
    ///   - manager: The networking manager
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
                         success: { (responseData: Data) in
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
    
}

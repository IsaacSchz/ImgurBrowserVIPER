//
//  ImageDetailRequestManager.swift
//  ImgurImagesVIPER
//
//  Created by Isaac Sanchez on 04/08/20.
//  Copyright © 2020 Isaac Sanchez. All rights reserved.
//

import Foundation

class ImageDetailRequestManager: ImageDetailRequestManagerProtocol {
    
    /// - Parameters:
    ///   - session: The URLSession
    ///   - manager: The networking manager
    ///   - success: The success complition handler
    ///   - failure: The failure complition handler
    func fetchComments (
        forId postId: String,
        with session: URLSessionProtocol = URLSession.shared,
        success: @escaping ([ImgurComment]) -> Void,
        failure: @escaping (ServiceConstants.NetworkingError) -> Void) {
        
        guard let url = URL(string: ImgurCommentsRequest(postId).urlString) else { return }
        var urlRequest = URLRequest(url: url)
        urlRequest.setValue("Client-ID \(ServiceConstants.clientId)", forHTTPHeaderField: "Authorization")
        
        NetworkManager.pullData(with: session, request: urlRequest,
                         success: { (responseData: Data, _) in
                            do {
                                let jsonDecoder = JSONDecoder()
                                let result = try jsonDecoder.decode(ImgurCommentsResponse.self, from: responseData)
                                success(result.comments ?? [])
                                
                            } catch {
                                failure(ServiceConstants.NetworkingError.invalidData)
                            } },
                         
                         failure: { error in
                            failure(error)
        })
    }
}

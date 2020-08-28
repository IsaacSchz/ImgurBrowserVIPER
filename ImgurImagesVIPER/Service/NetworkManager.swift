//
//  NetworkManager.swift
//  ImgurImagesVIPER
//
//  Created by Isaac Sanchez on 04/08/20.
//  Copyright © 2020 Isaac Sanchez. All rights reserved.
//

import Foundation

struct NetworkManager {
    
    /// Execute the request using the request data and the given session
    /// - Parameters:
    ///   - session: The injected URLSessionInterface
    ///   - request: The URL request
    ///   - success: The complition handler for success
    ///   - failure: The complition handler for the failure
    static func pullData(with session: URLSessionProtocol, request: URLRequest,
                  success: @escaping (Data, HTTPURLResponse) -> Void, failure: @escaping (ServiceConstants.NetworkingError) -> Void) {
        
        session.dataTask(with: request) { (data, response, error) in
            
            guard error == nil else {
                failure(ServiceConstants.NetworkingError.responseError)
                return
            }
            
            if let data = data, let response = response as? HTTPURLResponse{
                if  200...299 ~= response.statusCode {
                    success(data, response)
                } else {
                    failure(ServiceConstants.NetworkingError.responseError)
                }
            } else {
                failure(ServiceConstants.NetworkingError.responseError)
            }
            
        }.resume()
    }
    
}

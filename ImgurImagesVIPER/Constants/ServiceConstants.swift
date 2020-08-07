//
//  ServiceConstants.swift
//  ImgurImagesVIPER
//
//  Created by Isaac Sanchez on 04/08/20.
//  Copyright © 2020 Isaac Sanchez. All rights reserved.
//

import Foundation

enum Result<Success, Failure> {
    case success(Success)
    case failure(Failure)
}

struct ServiceConstants {
    
    // MARK: - ENUMS

    enum HTTPMethod : String {
        case get = "GET"
    }
    
    enum NetworkingError: Error {
        case responseError
        case invalidURL
        case emptyData
        case invalidData
    }
    
    
    // MARK: - VARIABLES
    
    static let baseURL = "https://api.imgur.com/3/gallery/"
    static let clientId = "YOUR API KEY"

}

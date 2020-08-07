//
//  ImgurCommentsRequest.swift
//  ImgurImagesVIPER
//
//  Created by Isaac Sanchez on 04/08/20.
//  Copyright © 2020 Isaac Sanchez. All rights reserved.
//

import Foundation

struct ImgurCommentsRequest {

    let baseUrlString: String
    var postId: String
    var urlString: String
    
    init(_ postId: String) {
        self.baseUrlString = ServiceConstants.baseURL
        self.postId = postId
        self.urlString = self.baseUrlString + "\(self.postId)/comments/"
    }
    
}

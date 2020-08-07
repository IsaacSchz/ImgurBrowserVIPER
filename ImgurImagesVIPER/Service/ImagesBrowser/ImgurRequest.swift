//
//  ImgurRequest.swift
//  ImgurImagesVIPER
//
//  Created by Isaac Sanchez on 04/08/20.
//  Copyright © 2020 Isaac Sanchez. All rights reserved.
//

struct ImgurRequest {

    let baseUrlString: String
    var pageNumber: String
    let searchParameter: String
    var searchQuery: String
    var urlString: String
    
    init(_ searchParameter: String) {
        self.baseUrlString = ServiceConstants.baseURL
        self.pageNumber = "0"
        self.searchParameter = searchParameter
        self.searchQuery = "?q=\(self.searchParameter)"
        self.urlString = self.baseUrlString + "search/" + self.pageNumber + self.searchQuery
    }
    
}

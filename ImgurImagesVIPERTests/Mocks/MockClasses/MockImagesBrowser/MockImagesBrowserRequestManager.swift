//
//  MockImagesBrowserRequestManager.swift
//  ImgurImagesVIPERTests
//
//  Created by Isaac Sanchez on 05/08/20.
//  Copyright © 2020 Isaac Sanchez. All rights reserved.
//

import Foundation
@testable import ImgurImagesVIPER

class MockImagesBrowserRequestManager: ImagesBrowserRequestManagerProtocol {
    
    var fetchPostsCalled = false
    var downloadImageCalled = false
    
    func fetchPosts(by keyword: String, with session: URLSessionProtocol, success: @escaping ([ImgurPost]) -> Void, failure: @escaping (ServiceConstants.NetworkingError) -> Void) {
        
        fetchPostsCalled = true
        
    }
    
    func downloadImage(with url: URL, with session: URLSessionProtocol, success: @escaping (Data) -> Void, failure: @escaping (ServiceConstants.NetworkingError) -> Void) {
        
        downloadImageCalled = true
        
    }

}

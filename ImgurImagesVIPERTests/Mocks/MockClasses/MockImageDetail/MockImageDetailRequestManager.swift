//
//  MockImageDetailRequestManager.swift
//  ImgurImagesVIPERTests
//
//  Created by Isaac Sanchez on 05/08/20.
//  Copyright © 2020 Isaac Sanchez. All rights reserved.
//

import Foundation
@testable import ImgurImagesVIPER

class MockImageDetailRequestManager: ImageDetailRequestManagerProtocol {
    
    var fetchCommentsCalled = false
    
    func fetchComments(forId postId: String, with session: URLSessionProtocol, success: @escaping ([ImgurComment]) -> Void, failure: @escaping (ServiceConstants.NetworkingError) -> Void) {
        
        fetchCommentsCalled = true
        
    }
    
}

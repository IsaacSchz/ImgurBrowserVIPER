//
//  MockImageDetailInteractor.swift
//  ImgurImagesVIPERTests
//
//  Created by Isaac Sanchez on 05/08/20.
//  Copyright © 2020 Isaac Sanchez. All rights reserved.
//

import Foundation
@testable import ImgurImagesVIPER

class MockImageDetailInteractor: ImageDetailInteractorProtocol {
    
    var fetchCommentsCalled = false
    
    func fetchComments(forId postId: String, completion: @escaping (Result<[ImgurComment], ServiceConstants.NetworkingError>) -> Void) {
        
        fetchCommentsCalled = true
        
    }

}

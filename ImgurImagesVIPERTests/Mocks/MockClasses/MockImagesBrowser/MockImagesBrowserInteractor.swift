//
//  MockImagesBrowserInteractor.swift
//  ImgurImagesVIPERTests
//
//  Created by Isaac Sanchez on 05/08/20.
//  Copyright © 2020 Isaac Sanchez. All rights reserved.
//

import Foundation
@testable import ImgurImagesVIPER

class MockImagesBrowserInteractor: ImagesBrowserInteractorProtocol {
    
    var fetchPostsCalled = false
    
    func fetchPosts(by keyword: String, completion: @escaping (Result<[ImgurPost], ServiceConstants.NetworkingError>) -> Void) {
        
        fetchPostsCalled = true
        
    }
    
    
}

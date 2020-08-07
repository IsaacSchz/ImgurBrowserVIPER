//
//  MockImagesBrowserPresenter.swift
//  ImgurImagesVIPERTests
//
//  Created by Isaac Sanchez on 05/08/20.
//  Copyright © 2020 Isaac Sanchez. All rights reserved.
//

import Foundation
@testable import ImgurImagesVIPER

class MockImagesBrowserPresenter: ImagesBrowserPresenterProtocol {
    
    var updatePostsCalled = false
    
    func updatePosts(with keyword: String) {
        updatePostsCalled = true
    }
  
}

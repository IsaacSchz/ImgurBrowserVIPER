//
//  MockImageDetailPresenter.swift
//  ImgurImagesVIPERTests
//
//  Created by Isaac Sanchez on 05/08/20.
//  Copyright © 2020 Isaac Sanchez. All rights reserved.
//

import Foundation
@testable import ImgurImagesVIPER

class MockImageDetailPresenter: ImageDetailPresenterProtocol {
    
    var updateCommentsCalled = false
    
    func updateComments(with postId: String) {
        
        updateCommentsCalled = true
        
    }
    
}

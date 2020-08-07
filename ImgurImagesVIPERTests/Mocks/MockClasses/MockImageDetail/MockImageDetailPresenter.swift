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
    
    var updateImageDetailCalled = false
    
    func updateImageDetail(with postId: String, imageURL: URL?) {
        
        updateImageDetailCalled = true
        
    }

}

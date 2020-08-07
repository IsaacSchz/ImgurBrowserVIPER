//
//  ImageDetailInteractorTest.swift
//  ImgurImagesVIPERTests
//
//  Created by Isaac Sanchez on 05/08/20.
//  Copyright © 2020 Isaac Sanchez. All rights reserved.
//

import XCTest
@testable import ImgurImagesVIPER

class ImageDetailInteractorTest: XCTestCase {
    
    func testImageDetailRequestWasCalled() {
        
        let mockRequest = MockImageDetailRequestManager()
        let sut = ImageDetailInteractor(requestManager: mockRequest)
        
        sut.fetchComments(forId: "123") { (_) in
            XCTAssertTrue(mockRequest.fetchCommentsCalled)
        }
    }

}

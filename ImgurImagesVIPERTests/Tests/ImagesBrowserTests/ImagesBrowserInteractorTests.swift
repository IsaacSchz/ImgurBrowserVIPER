//
//  ImagesBrowserInteractorTests.swift
//  ImgurImagesVIPERTests
//
//  Created by Isaac Sanchez on 05/08/20.
//  Copyright © 2020 Isaac Sanchez. All rights reserved.
//

import XCTest
@testable import ImgurImagesVIPER

class ImagesBrowserInteractorTests: XCTestCase {
    
    func testIMagesBrowserRequestWasCalled() {
        
        let mockRequestManager = MockImagesBrowserRequestManager()
        let sut = ImagesBrowserInteractor(requestManager: mockRequestManager)
        
        sut.fetchPosts(by: "Cats") { (_) in
            XCTAssertTrue(mockRequestManager.fetchPostsCalled)
        }
        
    }


}

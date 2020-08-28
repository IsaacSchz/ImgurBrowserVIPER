//
//  ImgurPostCellInteractorTest.swift
//  ImgurImagesVIPERTests
//
//  Created by Isaac Sanchez on 18/08/20.
//  Copyright © 2020 Isaac Sanchez. All rights reserved.
//

import XCTest
@testable import ImgurImagesVIPER

class ImgurPostCellInteractorTest: XCTestCase {
    
    var testUrlImage = "https://www.google.com/images/branding/googlelogo/2x/googlelogo_color_272x92dp.png"

    func testIMagesBrowserRequestWasCalled() {
        
        let mockRequestManager = MockImagesBrowserRequestManager()
        let sut = ImgurPostCellInteractor(requestManager: mockRequestManager)
        
        guard let url = URL(string: testUrlImage) else { XCTFail(); return }
        sut.downloadImage(with: url) { (_) in
            XCTAssertTrue(mockRequestManager.downloadImageCalled)
        }
        
    }
    
    override func tearDown() {
        super.tearDown()
    }

}

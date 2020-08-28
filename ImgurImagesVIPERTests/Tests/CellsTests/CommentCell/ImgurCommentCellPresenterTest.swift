//
//  ImgurCommentCellPresenterTest.swift
//  ImgurImagesVIPERTests
//
//  Created by Isaac Sanchez on 18/08/20.
//  Copyright © 2020 Isaac Sanchez. All rights reserved.
//

import XCTest
@testable import ImgurImagesVIPER

class ImgurCommentCellPresenterTest: XCTestCase {
    
    var sut: MockImgurCommentCellPresenter?

    override func setUp() {
        
        sut = MockImgurCommentCellPresenter()
    }
    
    func testDownloadImageDataCalled() {
        sut?.updateComment()
        XCTAssertTrue(sut?.updateCommentCalled ?? false)
    }
    
    override func tearDown() {
        sut = nil
        super.tearDown()
    }

}

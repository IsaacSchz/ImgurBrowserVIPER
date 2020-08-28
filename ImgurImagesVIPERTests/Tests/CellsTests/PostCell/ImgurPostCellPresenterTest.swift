//
//  ImgurPostCellPresenterTest.swift
//  ImgurImagesVIPERTests
//
//  Created by Isaac Sanchez on 18/08/20.
//  Copyright © 2020 Isaac Sanchez. All rights reserved.
//

import XCTest
@testable import ImgurImagesVIPER

class ImgurPostCellPresenterTest: XCTestCase {

    var mockView: MockImgurPostCellView?
    var mockInteractor: MockImgurPostCellInteractor?
    var sut: ImgurPostCellPresenter?

    override func setUp() {
        
        mockView = MockImgurPostCellView()
        mockInteractor = MockImgurPostCellInteractor()
        
        guard let mockView = mockView else { XCTFail("mockView is nil"); return }
        guard let mockInteractor = mockInteractor else { XCTFail("mockInteractor is nil"); return }
        
        sut = ImgurPostCellPresenter(view: mockView, interactor: mockInteractor)
    }
    
    func testDownloadImageDataCalled() {
        sut?.downloadImageData()
        XCTAssertTrue(mockInteractor?.downloadImageCalled ?? false)
    }

    override func tearDown() {
        super.tearDown()
        mockView = nil
        mockInteractor = nil
        sut = nil
    }

}

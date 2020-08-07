//
//  ImagesBrowserPresenterTests.swift
//  ImgurImagesVIPERTests
//
//  Created by Isaac Sanchez on 05/08/20.
//  Copyright © 2020 Isaac Sanchez. All rights reserved.
//

import XCTest
@testable import ImgurImagesVIPER

class ImagesBrowserPresenterTests: XCTestCase {

    var mockView: MockImagesBrowserView?
    var mockInteractor: MockImagesBrowserInteractor?
    var sut: ImagesBrowserPresenter?
    
    override func setUp() {
        
        mockView = MockImagesBrowserView()
        mockInteractor = MockImagesBrowserInteractor()
        
        guard let mockView = mockView else { XCTFail("mockView is nil"); return }
        guard let mockInteractor = mockInteractor else { XCTFail("mockInteractor is nil"); return }
        
        sut = ImagesBrowserPresenter(view: mockView, interactor: mockInteractor)
    }
    
    func testFetchPostsCalled() {
        sut?.updatePosts(with: "Cats")
        XCTAssertTrue(mockInteractor?.fetchPostsCalled ?? false)
    }
    
    override func tearDown() {
        super.tearDown()
        mockView = nil
        mockInteractor = nil
        sut = nil
    }

}

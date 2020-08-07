//
//  ImageDetailPresenterTests.swift
//  ImgurImagesVIPERTests
//
//  Created by Isaac Sanchez on 05/08/20.
//  Copyright © 2020 Isaac Sanchez. All rights reserved.
//

import XCTest
@testable import ImgurImagesVIPER

class ImageDetailPresenterTests: XCTestCase {
    
    var mockView: MockImageDetailView?
    var mockInteractor: MockImageDetailInteractor?
    var sut: ImageDetailPresenter?
    
    override func setUp() {
        
        mockView = MockImageDetailView()
        mockInteractor = MockImageDetailInteractor()
        
        guard let mockView = mockView else { XCTFail("mockView is nil"); return }
        guard let mockInteractor = mockInteractor else { XCTFail("mockInteractor is nil"); return }
        sut = ImageDetailPresenter(view: mockView, interactor: mockInteractor)
        
    }
    
    func testFetchCommentsCalled() {
        
        sut?.updateImageDetail(with: "123", imageURL: URL(string: "www.apple.com"))
        XCTAssertTrue(mockInteractor?.fetchCommentsCalled ?? false)
    }

    override func tearDown() {
        super.tearDown()
        mockView = nil
        mockInteractor = nil
        sut = nil
    }

}

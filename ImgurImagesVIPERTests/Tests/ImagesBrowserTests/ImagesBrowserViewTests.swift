//
//  ImagesBrowserViewTests.swift
//  ImgurImagesVIPERTests
//
//  Created by Isaac Sanchez on 05/08/20.
//  Copyright © 2020 Isaac Sanchez. All rights reserved.
//

import XCTest
@testable import ImgurImagesVIPER

class ImagesBrowserViewTests: XCTestCase {
    
    var sut: ImagesBrowserViewController?
    var testUrlImage = "https://www.google.com/images/branding/googlelogo/2x/googlelogo_color_272x92dp.png"
    
    override func setUp() {
        // given
        sut = ImagesBrowserViewController.loadFromStoryboard(storyboardName: "Main")
    }
    
    func testSearchBarExists() {
        sut?.loadViewIfNeeded()
        XCTAssertNotNil(sut?.searchBar)
    }
    
    func testPostsTableViewExists() {
        sut?.loadViewIfNeeded()
        XCTAssertNotNil(sut?.postsTableView)
    }
    
    func testImgurPostCellIsNotNil() {
        guard let imageURL = URL(string: testUrlImage) else { XCTFail("Wrong URL"); return }
        let dummyImgurPostCellPresenter = ImgurPostCellPresenter(postId: "1", imageUrl: imageURL, width: 10.0, height: 10.0)
        let testIndexPath = IndexPath(item: 3, section: 0)
        
        sut?.loadViewIfNeeded()
        sut?.posts = [ImgurPostCellPresenter](repeating: dummyImgurPostCellPresenter, count: 4)
        guard let postsTableView = sut?.postsTableView else { XCTFail("PostsTableView is nil"); return }
        postsTableView.register(UINib(nibName: "ImgurPostCell", bundle: nil), forCellReuseIdentifier: "ImgurPostCell")
        
        XCTAssertNotNil(sut?.tableView(postsTableView, cellForRowAt: testIndexPath) as? ImgurPostCell)
    }
    
    func testImgurPostCellViewsAreNotNil() {
        guard let imageURL = URL(string: testUrlImage) else { XCTFail("Wrong URL"); return }
        let dummyImgurPostCellPresenter = ImgurPostCellPresenter(postId: "1", imageUrl: imageURL, width: 10.0, height: 10.0)
        let testIndexPath = IndexPath(item: 3, section: 0)
        
        sut?.loadViewIfNeeded()
        sut?.posts = [ImgurPostCellPresenter](repeating: dummyImgurPostCellPresenter, count: 4)
        guard let postsTableView = sut?.postsTableView else { XCTFail("PostsTableView is nil"); return }
        postsTableView.register(UINib(nibName: "ImgurPostCell", bundle: nil), forCellReuseIdentifier: "ImgurPostCell")
        guard let cell = sut?.tableView(postsTableView, cellForRowAt: testIndexPath) as? ImgurPostCell else { XCTFail("Cell ImgurPostCell is nil"); return }
        
        XCTAssertNotNil(cell.postImage)
        XCTAssertNotNil(cell.hConstraint)
    }
    
    func testImgurPostCellShowsCorrectInformation() {
        guard let imageURL = URL(string: testUrlImage) else { XCTFail("Wrong URL"); return }
        let dummyImgurPostCellPresenter = ImgurPostCellPresenter(postId: "1", imageUrl: imageURL, width: 10.0, height: 10.0)
        let testIndexPath = IndexPath(item: 3, section: 0)
        
        sut?.loadViewIfNeeded()
        sut?.posts = [ImgurPostCellPresenter](repeating: dummyImgurPostCellPresenter, count: 4)
        guard let postsTableView = sut?.postsTableView else { XCTFail("PostsTableView is nil"); return }
        postsTableView.register(UINib(nibName: "ImgurPostCell", bundle: nil), forCellReuseIdentifier: "ImgurPostCell")
        guard let cell = sut?.tableView(postsTableView, cellForRowAt: testIndexPath) as? ImgurPostCell else { XCTFail("Cell ImgurPostCell is nil"); return }
        
        XCTAssertEqual(cell.imageUrl, imageURL.absoluteString)
    }
    
    
    func testLoadCellPerformance() throws {
        self.measure {
            
            guard let imageURL = URL(string: testUrlImage) else { XCTFail("Wrong URL"); return }
            let dummyImgurPostCellPresenter = ImgurPostCellPresenter(postId: "1", imageUrl: imageURL, width: 10.0, height: 10.0)
            let testIndexPath = IndexPath(item: 3, section: 0)
            
            sut?.loadViewIfNeeded()
            sut?.posts = [ImgurPostCellPresenter](repeating: dummyImgurPostCellPresenter, count: 4)
            guard let postsTableView = sut?.postsTableView else { XCTFail("PostsTableView is nil"); return }
            postsTableView.register(UINib(nibName: "ImgurPostCell", bundle: nil), forCellReuseIdentifier: "ImgurPostCell")
            guard let cell = sut?.tableView(postsTableView, cellForRowAt: testIndexPath) as? ImgurPostCell else { XCTFail("Cell ImgurPostCell is nil"); return }
            
            XCTAssertEqual(cell.imageUrl, imageURL.absoluteString)
        }
    }
    
    override func tearDown() {
        sut = nil
        super.tearDown()
    }
    
}

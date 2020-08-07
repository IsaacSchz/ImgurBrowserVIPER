//
//  ImageDetailViewTests.swift
//  ImgurImagesVIPERTests
//
//  Created by Isaac Sanchez on 05/08/20.
//  Copyright © 2020 Isaac Sanchez. All rights reserved.
//

import XCTest
@testable import ImgurImagesVIPER

class ImageDetailViewTests: XCTestCase {
    
    var sut: ImageDetailViewController?
    
    override func setUp() {
        sut = ImageDetailViewController.loadFromStoryboard(storyboardName: "Main")
    }

    func testDetailedImagesExists() {
        sut?.loadViewIfNeeded()
        XCTAssertNotNil(sut?.detailedImageView)
    }
    
    func testCommentsTableViewExists() {
        sut?.loadViewIfNeeded()
        XCTAssertNotNil(sut?.commentsTableView)
    }
    
    func testNoCommentsViewExists() {
        sut?.loadViewIfNeeded()
        XCTAssertNotNil(sut?.noCommentsView)
    }
    
    func testImgurCommentCellIsNotNil() {
        let dummyImgurCommentCellPresenter = ImgurCommentCellPresenter(comment: "This is a Test")
        let testIndexPath = IndexPath(row: 3, section: 0)
        
        sut?.loadViewIfNeeded()
        sut?.comments = [ImgurCommentCellPresenter](repeating: dummyImgurCommentCellPresenter, count: 4)
        guard let commentsTableView = sut?.commentsTableView else { XCTFail("commentsTableView is nil"); return }
        commentsTableView.register(UINib(nibName: "ImgurCommentCell", bundle: nil), forHeaderFooterViewReuseIdentifier: "ImgurCommentCell")
        
        XCTAssertNotNil(sut?.tableView(commentsTableView, cellForRowAt: testIndexPath) as? ImgurCommentCell)
    }
    
    func testImgurCommentCellViewsAreNotNil() {
        let dummyImgurCommentCellPresenter = ImgurCommentCellPresenter(comment: "This is a Test")
        let testIndexPath = IndexPath(row: 3, section: 0)
        
        sut?.loadViewIfNeeded()
        sut?.comments = [ImgurCommentCellPresenter](repeating: dummyImgurCommentCellPresenter, count: 4)
        guard let commentsTableView = sut?.commentsTableView else { XCTFail("commentsTableView is nil"); return }
        commentsTableView.register(UINib(nibName: "ImgurCommentCell", bundle: nil), forHeaderFooterViewReuseIdentifier: "ImgurCommentCell")
        
        guard let cell = sut?.tableView(commentsTableView, cellForRowAt: testIndexPath) as? ImgurCommentCell else { XCTFail("commentCell is nil"); return }
        XCTAssertNotNil(cell.commentLabel)
    }
    
    func testImgurCommentCellShowsCorrectInformation() {
        let dummyImgurCommentCellPresenter = ImgurCommentCellPresenter(comment: "This is a Test")
        let testIndexPath = IndexPath(row: 3, section: 0)
        
        sut?.loadViewIfNeeded()
        sut?.comments = [ImgurCommentCellPresenter](repeating: dummyImgurCommentCellPresenter, count: 4)
        guard let commentsTableView = sut?.commentsTableView else { XCTFail("commentsTableView is nil"); return }
        commentsTableView.register(UINib(nibName: "ImgurCommentCell", bundle: nil), forHeaderFooterViewReuseIdentifier: "ImgurCommentCell")
        
        guard let cell = sut?.tableView(commentsTableView, cellForRowAt: testIndexPath) as? ImgurCommentCell else { XCTFail("commentCell is nil"); return }
        XCTAssertEqual(cell.commentLabel?.text, "This is a Test")
    }
    
    override func tearDown() {
        sut = nil
        super.tearDown()
    }

}

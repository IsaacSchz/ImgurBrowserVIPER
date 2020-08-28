//
//  ImgurCommentCellViewTest.swift
//  ImgurImagesVIPERTests
//
//  Created by Isaac Sanchez on 18/08/20.
//  Copyright © 2020 Isaac Sanchez. All rights reserved.
//

import XCTest
@testable import ImgurImagesVIPER

class ImgurCommentCellViewTest: XCTestCase {
    
    var sut: ImageDetailViewController?
    
    override func setUp() {
        sut = ImageDetailViewController.loadFromStoryboard(storyboardName: "Main")
    }

    func testImgurCommentCellViewsAreNotNil() {
        let cellInteractor = MockImgurCommentCellInteractor()
        let dummyImgurCommentCellPresenter = ImgurCommentCellPresenter(view: nil,
                                                                       interactor: cellInteractor,
                                                                       comment: "This is a Test")
        let testIndexPath = IndexPath(row: 3, section: 0)
        
        sut?.loadViewIfNeeded()
        sut?.comments = [ImgurCommentCellPresenter](repeating: dummyImgurCommentCellPresenter, count: 4)
        guard let commentsTableView = sut?.commentsTableView else { XCTFail("commentsTableView is nil"); return }
        commentsTableView.register(UINib(nibName: "ImgurCommentCell", bundle: nil), forHeaderFooterViewReuseIdentifier: "ImgurCommentCell")
        
        guard let cell = sut?.tableView(commentsTableView, cellForRowAt: testIndexPath) as? ImgurCommentCell else { XCTFail("commentCell is nil"); return }
        XCTAssertNotNil(cell.commentLabel)
    }
    
    func testImgurCommentCellShowsCorrectInformation() {
        let cellInteractor = MockImgurCommentCellInteractor()
        let dummyImgurCommentCellPresenter = ImgurCommentCellPresenter(view: nil,
                                                                       interactor: cellInteractor,
                                                                       comment: "This is a Test")
        let testIndexPath = IndexPath(row: 3, section: 0)
        
        sut?.loadViewIfNeeded()
        sut?.comments = [ImgurCommentCellPresenter](repeating: dummyImgurCommentCellPresenter, count: 4)
        guard let commentsTableView = sut?.commentsTableView else { XCTFail("commentsTableView is nil"); return }
        commentsTableView.register(UINib(nibName: "ImgurCommentCell", bundle: nil), forHeaderFooterViewReuseIdentifier: "ImgurCommentCell")
        
        let currentComment = sut?.comments?[testIndexPath.row]
        guard let cell = sut?.tableView(commentsTableView, cellForRowAt: testIndexPath) as? ImgurCommentCell else { XCTFail("commentCell is nil"); return }
        currentComment?.setView(cell)
        currentComment?.updateComment()
        
        DispatchQueue.main.asyncAfter(deadline: .now()) {
            XCTAssertEqual(cell.commentLabel?.text, "This is a Test")
        }
    }
    
    override func tearDown() {
        sut = nil
        super.tearDown()
    }

}

//
//  ImgurPostCellViewTest.swift
//  ImgurImagesVIPERTests
//
//  Created by Isaac Sanchez on 18/08/20.
//  Copyright © 2020 Isaac Sanchez. All rights reserved.
//

import XCTest
@testable import ImgurImagesVIPER

class ImgurPostCellViewTest: XCTestCase {
    
    var sut: ImagesBrowserViewController?
    var testUrlImage = "https://www.google.com/images/branding/googlelogo/2x/googlelogo_color_272x92dp.png"
    
    override func setUp() {
        sut = ImagesBrowserViewController.loadFromStoryboard(storyboardName: "Main")
    }
    
    func testImgurPostCellViewsAreNotNil() {
        guard let imageURL = URL(string: testUrlImage) else { XCTFail("Wrong URL"); return }
        let cellInteractor = MockImgurPostCellInteractor()
        let dummyImgurPostCellPresenter = ImgurPostCellPresenter(view: nil,
                                                                 interactor: cellInteractor,
                                                                 postId: "1",
                                                                 imageUrl: imageURL,
                                                                 width: 10.0,
                                                                 height: 10.0)
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
        let cellInteractor = ImgurPostCellInteractor()
        let dummyImgurPostCellPresenter = ImgurPostCellPresenter(view: nil,
                                                                 interactor: cellInteractor,
                                                                 postId: "1",
                                                                 imageUrl: imageURL,
                                                                 width: 10.0,
                                                                 height: 10.0)
        let testIndexPath = IndexPath(item: 3, section: 0)
        
        sut?.loadViewIfNeeded()
        sut?.posts = [ImgurPostCellPresenter](repeating: dummyImgurPostCellPresenter, count: 4)
        
        guard let postsTableView = sut?.postsTableView else { XCTFail("PostsTableView is nil"); return }
        postsTableView.register(UINib(nibName: "ImgurPostCell", bundle: nil), forCellReuseIdentifier: "ImgurPostCell")
        
        let currentPost = sut?.posts?[testIndexPath.row]
        guard let cell = sut?.tableView(postsTableView, cellForRowAt: testIndexPath) as? ImgurPostCell else { XCTFail("Cell ImgurPostCell is nil"); return }
        currentPost?.setView(cell)
        currentPost?.downloadImageData()

        DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
            guard cell.imageData != nil && currentPost?.imageData != nil else { XCTFail(); return }
            guard cell.imageData == currentPost?.imageData else { XCTFail(); return }
            XCTAssertEqual(cell.imageData, currentPost?.imageData)
        }
    }
    
    override func tearDown() {
        sut = nil
        super.tearDown()
    }

}

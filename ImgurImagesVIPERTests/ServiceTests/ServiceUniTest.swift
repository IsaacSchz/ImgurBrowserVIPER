//
//  ServiceUniTest.swift
//  ImgurImagesVIPERTests
//
//  Created by Isaac Sanchez on 05/08/20.
//  Copyright © 2020 Isaac Sanchez. All rights reserved.
//

import XCTest
@testable import ImgurImagesVIPER

class ServiceUniTest: XCTestCase {
    
    func testImagesBrowserPostsAreFetchedWithSuccess() {
        
        let session = MockURLSessionSuccess()
        
        let testBundle = Bundle(for: type(of: self))
        guard let path = testBundle.path(forResource: "PostsMock", ofType: "json") else { XCTFail("Invalid path"); return }
        
        let data = try? Data(contentsOf: URL(fileURLWithPath: path), options: .alwaysMapped)
        let expectation = XCTestExpectation(description: "Posts data downloads with success")
        session.testData = data
        
        ImagesBrowserRequestManager().fetchPosts(by: "Cats", with: session, success: { (posts) in
            expectation.fulfill()
        }) { (error) in
            XCTFail()
        }
        
        wait(for: [expectation], timeout: 1)

    }
    
    func testImagesBrowserPostsAreFetchedWithInvalidDataError() {
        
        let session = MockURLSessionSuccess()
        
        let testBundle = Bundle(for: type(of: self))
        guard let path = testBundle.path(forResource: "BadPostsMock", ofType: "json") else { XCTFail("Invalid path"); return }
        
        let data = try? Data(contentsOf: URL(fileURLWithPath: path), options: .alwaysMapped)
        let expectation = XCTestExpectation(description: "Posts data downloads with success")
        session.testData = data
        
        ImagesBrowserRequestManager().fetchPosts(by: "Cats", with: session, success: { (posts) in
            XCTFail()
        }) { (error) in
            if error == ServiceConstants.NetworkingError.invalidData {
                expectation.fulfill()
            } else {
                XCTFail()
            }
        }
        
        wait(for: [expectation], timeout: 1)

    }
    
    func testImageDetailDataIsFetchedWithSuccess() {
        
        let session = MockURLSessionSuccess()
        
        let testBundle = Bundle(for: type(of: self))
        guard let path = testBundle.path(forResource: "CommentsMock", ofType: "json") else { XCTFail("Invalid path"); return }
        
        let data = try? Data(contentsOf: URL(fileURLWithPath: path), options: .alwaysMapped)
        let expectation = XCTestExpectation(description: "Comments data data downloads with success")
        session.testData = data
        
        ImageDetailRequestManager().fetchComments(forId: "8Oi1VNa", with: session, success: { comments in
            expectation.fulfill()
        }) { (error) in
            XCTFail()
        }
        
        wait(for: [expectation], timeout: 1)

    }
    
    func testImageDetailDataIsFetchedWithInvalidDataError() {
        
        let session = MockURLSessionSuccess()
        
        let testBundle = Bundle(for: type(of: self))
        guard let path = testBundle.path(forResource: "BadCommentsMock", ofType: "json") else { XCTFail("Invalid path"); return }
        
        let data = try? Data(contentsOf: URL(fileURLWithPath: path), options: .alwaysMapped)
        let expectation = XCTestExpectation(description: "Comments data data downloads with success")
        session.testData = data
        
        ImageDetailRequestManager().fetchComments(forId: "8Oi1VNa", with: session, success: { _ in
            XCTFail()
        }, failure: { error in
            if error == ServiceConstants.NetworkingError.invalidData {
                expectation.fulfill()
            } else {
                XCTFail()
            }
        })
        
        wait(for: [expectation], timeout: 1)

    }
    
    func testNetworkManagerWithFailure() {
        
        let session = MockURLSessionFailure()
        let testBundle = Bundle(for: type(of: self))
        guard let path = testBundle.path(forResource: "BadPostsMock", ofType: "json") else { XCTFail("Invalid path"); return }
        
        let data = try? Data(contentsOf: URL(fileURLWithPath: path), options: .alwaysMapped)
        let expectation = XCTestExpectation(description: "Comments data data downloads with success")
        session.testData = data
        guard let testURL = URL(string: "www.dummy_url.com") else {  XCTFail("Invalid dummy url"); return }
        
        NetworkManager.pullData(with: session, request: URLRequest(url: testURL), success: { _ in
            XCTFail()
        }) { error in
            if error == ServiceConstants.NetworkingError.responseError {
                expectation.fulfill()
            } else {
                XCTFail("There was an error")
            }
        }
        
        wait(for: [expectation], timeout: 1)
    }

}

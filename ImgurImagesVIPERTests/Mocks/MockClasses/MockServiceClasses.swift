//
//  MockServiceClasses.swift
//  ImgurImagesVIPERTests
//
//  Created by Isaac Sanchez on 05/08/20.
//  Copyright © 2020 Isaac Sanchez. All rights reserved.
//

import Foundation
@testable import ImgurImagesVIPER

class DataTaskDummy: URLSessionDataTask {
    
    override func resume() { }
    
}

class MockURLSessionSuccess: URLSessionProtocol {
    
    var testData: Data?
    
    func dataTask(with urlRequest: URLRequest, completionHandler: @escaping (Data?, URLResponse?, Error?) -> Void) -> URLSessionDataTask {
        
        defer {
            if let dummyURL = URL(string: "www.dummy_url.com") {
                completionHandler(testData, HTTPURLResponse(url: dummyURL, statusCode: 200, httpVersion: nil, headerFields: nil), nil)
            } else {
                fatalError("The url could not be created")
            }
        }
        
        return DataTaskDummy()
        
    }
    
}

class MockURLSessionFailure: URLSessionProtocol {
    
    var testData: Data?
    
    func dataTask(with urlRequest: URLRequest, completionHandler: @escaping (Data?, URLResponse?, Error?) -> Void) -> URLSessionDataTask {
        
        defer {
            if let dummyURL = URL(string: "www.dummy_url.com") {
                completionHandler(testData, HTTPURLResponse(url: dummyURL, statusCode: 404, httpVersion: nil, headerFields: nil), nil)
            } else {
                fatalError("The dummy url could not be created")
            }
        }

        return DataTaskDummy()
    }
    
}


    

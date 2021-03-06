//
//  MockImagesBrowserView.swift
//  ImgurImagesVIPERTests
//
//  Created by Isaac Sanchez on 05/08/20.
//  Copyright © 2020 Isaac Sanchez. All rights reserved.
//

import Foundation
@testable import ImgurImagesVIPER

class MockImagesBrowserView: ImagesBrowserViewProtocol {
    
    var posts: [ImgurPostCellPresenter]?
    var showNetworkingErrorCalled = false
    
    func showNetworkingError() {
        showNetworkingErrorCalled = true
    }

}

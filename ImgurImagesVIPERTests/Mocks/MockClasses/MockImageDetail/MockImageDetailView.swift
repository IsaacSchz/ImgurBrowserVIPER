//
//  MockImageDetailView.swift
//  ImgurImagesVIPERTests
//
//  Created by Isaac Sanchez on 05/08/20.
//  Copyright © 2020 Isaac Sanchez. All rights reserved.
//

import Foundation
@testable import ImgurImagesVIPER

class MockImageDetailView: ImageDetailViewProtocol {
    
    var detailedImage: DetailedImagePresenter?
    var comments: [ImgurCommentCellPresenter]?
    
    var showNoCommentsViewCalled = false
    var showNetowrkingError = false
    
    func showNoCommentsView() {
        showNoCommentsViewCalled = true
    }
    
    func showNetworkingError() {
        showNetowrkingError = true
    }
    
}

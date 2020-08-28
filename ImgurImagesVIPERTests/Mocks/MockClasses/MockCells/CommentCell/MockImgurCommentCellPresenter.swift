//
//  MockImgurCommentCellPresenter.swift
//  ImgurImagesVIPERTests
//
//  Created by Isaac Sanchez on 18/08/20.
//  Copyright © 2020 Isaac Sanchez. All rights reserved.
//

import Foundation
@testable import ImgurImagesVIPER

class MockImgurCommentCellPresenter: ImgurCommentCellPresenterProtocol {
    
    var updateCommentCalled = false
    
    func updateComment() {
        updateCommentCalled = true
    }

}

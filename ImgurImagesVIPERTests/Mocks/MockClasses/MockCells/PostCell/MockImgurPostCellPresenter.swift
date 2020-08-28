//
//  MockImgurPostCellPresenter.swift
//  ImgurImagesVIPERTests
//
//  Created by Isaac Sanchez on 18/08/20.
//  Copyright © 2020 Isaac Sanchez. All rights reserved.
//

import Foundation
@testable import ImgurImagesVIPER

class MockImgurPostCellPresenter: ImgurPostCellPresenterProtocol {
    
    var downloadImageDataCalled = false
    var getCellHeightCalled = false
    
    func downloadImageData() {
        downloadImageDataCalled = true
    }
    
    func getCellHeight(for tableViewWidth: Float) -> Float {
        getCellHeightCalled = true
        return 0.0
    }

}

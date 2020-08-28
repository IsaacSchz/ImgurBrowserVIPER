//
//  MockImgurCommentCellInteractor.swift
//  ImgurImagesVIPERTests
//
//  Created by Isaac Sanchez on 17/08/20.
//  Copyright © 2020 Isaac Sanchez. All rights reserved.
//

import Foundation
@testable import ImgurImagesVIPER

class MockImgurPostCellInteractor: ImgurPostCellInteractorProtocol {
    
    var downloadImageCalled = false
    
    func downloadImage(with url: URL, completion: @escaping (Result<Data, ServiceConstants.NetworkingError>) -> Void) {
        
        downloadImageCalled = true
        
    }

}

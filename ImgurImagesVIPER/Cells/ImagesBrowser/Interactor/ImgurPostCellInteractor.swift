//
//  asdasd.swift
//  ImgurImagesVIPER
//
//  Created by Isaac Sanchez on 17/08/20.
//  Copyright © 2020 Isaac Sanchez. All rights reserved.
//

import Foundation

class ImgurPostCellInteractor {
    
    let requestManager: ImagesBrowserRequestManagerProtocol

    init(requestManager: ImagesBrowserRequestManagerProtocol = ImagesBrowserRequestManager()) {
        self.requestManager = requestManager
    }
    
}

extension ImgurPostCellInteractor: ImgurPostCellInteractorProtocol {

    func downloadImage(with url: URL, completion: @escaping (Result<Data, ServiceConstants.NetworkingError>) -> Void) {
        requestManager.downloadImage(with: url, with: URLSession.shared, success: { imageData in
            completion(Result.success(imageData))
        }) { error in
            completion(Result.failure(error))
        }
    }
    
}

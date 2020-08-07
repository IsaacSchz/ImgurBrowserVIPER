//
//  ImageDetailInteractor.swift
//  ImgurImagesVIPER
//
//  Created by Isaac Sanchez on 04/08/20.
//  Copyright © 2020 Isaac Sanchez. All rights reserved.
//

import Foundation

class ImageDetailInteractor {
    
    let requestManager: ImageDetailRequestManagerProtocol
    
    init(requestManager: ImageDetailRequestManagerProtocol = ImageDetailRequestManager()) {
        self.requestManager = requestManager
    }
    
}

extension ImageDetailInteractor: ImageDetailInteractorProtocol {
    
    func fetchComments(forId postId: String, completion: @escaping (Result<[ImgurComment], ServiceConstants.NetworkingError>) -> Void) {
        
        requestManager.fetchComments(forId: postId, with: URLSession.shared, success: { comments in
            completion(Result.success(comments))
            
        }) { error in
            completion(Result.failure(error))
        }
        
    }
    
}

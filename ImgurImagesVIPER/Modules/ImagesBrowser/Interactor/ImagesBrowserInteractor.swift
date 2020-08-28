//
//  ImagesBrowserInteractor.swift
//  ImgurImagesVIPER
//
//  Created by Isaac Sanchez on 04/08/20.
//  Copyright © 2020 Isaac Sanchez. All rights reserved.
//

import Foundation

class ImagesBrowserInteractor {
    
    let requestManager: ImagesBrowserRequestManagerProtocol

    init(requestManager: ImagesBrowserRequestManagerProtocol = ImagesBrowserRequestManager()) {
        self.requestManager = requestManager
    }
    
}

extension ImagesBrowserInteractor: ImagesBrowserInteractorProtocol {

    func fetchPosts(by keyword: String, completion: @escaping (Result<[ImgurPost], ServiceConstants.NetworkingError>) -> Void) {
        
        /// Allows to use multiple keywords by encoding spaces proppertly.
        guard let keywordForRequest = keyword.addingPercentEncoding(withAllowedCharacters: .urlHostAllowed) else { return }
        
        requestManager.fetchPosts(by: keywordForRequest, with: URLSession.shared, success: { posts in
            completion(Result.success(posts))
        }) { error in
            completion(Result.failure(error))
        }
        
    }
    
}

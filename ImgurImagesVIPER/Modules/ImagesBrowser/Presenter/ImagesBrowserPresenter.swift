//
//  ImagesBrowserPresenter.swift
//  ImgurImagesVIPER
//
//  Created by Isaac Sanchez on 04/08/20.
//  Copyright © 2020 Isaac Sanchez. All rights reserved.
//

import Foundation

class ImagesBrowserPresenter {
    
    private weak var view: ImagesBrowserViewProtocol?
    private var interactor: ImagesBrowserInteractorProtocol
    
    init(view: ImagesBrowserViewProtocol?, interactor: ImagesBrowserInteractorProtocol) {
        self.view = view
        self.interactor = interactor
    }
    
}

extension ImagesBrowserPresenter: ImagesBrowserPresenterProtocol {
    
    func updatePosts(with keyword: String) {
        guard !keyword.isEmpty else { cleanTableView(); return }
        
        interactor.fetchPosts(by: keyword) { [weak self] response in
            self?.handleServiceResponse(response)
        }
    }
    
    func handleServiceResponse(_ response: Result<[ImgurPost], ServiceConstants.NetworkingError>) {
        DispatchQueue.main.async { [weak self] in
            switch response {
            case .success(let postsResponse):
                self?.setupCells(with: postsResponse)
                
            case .failure:
                self?.view?.showNetworkingError()
            }
        }
    }
    
    func setupCells(with postsResponse: [ImgurPost]) {
        var tempPosts: [ImgurPostCellPresenter] = []
        
        postsResponse.forEach { post in
            guard let postId = post.id else { return }
            guard let postImage = post.images?.first else { return }
            guard let postImageUrlString = postImage.imageURL,
                let imageWidth = postImage.width,
                let imageHeight = postImage.height else { return }
            
            guard !postImageUrlString.contains(".mp4") else { return }
            
            var imageUrl = postImageUrlString
            imageUrl.removeLast()
            imageUrl.removeLast()
            imageUrl.removeLast()
            imageUrl.removeLast()
            imageUrl = imageUrl + "l.jpg"
            
            guard let url = URL(string: imageUrl) else { return }
            
            let postCell = ImgurPostCellPresenter(view: nil,
                                                  interactor: ImgurPostCellInteractor(),
                                                  postId: postId,
                                                  imageUrl: url,
                                                  width: Double(imageWidth),
                                                  height: Double(imageHeight))
            tempPosts.append(postCell)
        }
        
        view?.posts = tempPosts
    }
    
    func cleanTableView() {
        view?.posts = []
    }
    
}

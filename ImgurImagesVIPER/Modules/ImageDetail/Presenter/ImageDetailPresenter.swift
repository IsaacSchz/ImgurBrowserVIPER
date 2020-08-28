//
//  ImageDetailPresenter.swift
//  ImgurImagesVIPER
//
//  Created by Isaac Sanchez on 04/08/20.
//  Copyright © 2020 Isaac Sanchez. All rights reserved.
//

import Foundation

class ImageDetailPresenter {
    
    private weak var view: ImageDetailViewProtocol?
    private var interactor: ImageDetailInteractorProtocol
    
    init(view: ImageDetailViewProtocol, interactor: ImageDetailInteractorProtocol) {
        self.view = view
        self.interactor = interactor
    }
    
}

extension ImageDetailPresenter: ImageDetailPresenterProtocol {
    
    func updateComments(with postId: String) {
        
        interactor.fetchComments(forId: postId) { [weak self] (response) in
            self?.handleServiceResponse(response)
        }
        
    }
    
    func handleServiceResponse(_ response: Result<[ImgurComment], ServiceConstants.NetworkingError>) {
        DispatchQueue.main.async { [weak self] in
            switch response {
            case .success(let commentsResponse):
                self?.setupComments(with: commentsResponse)
            case .failure:
                self?.view?.showNetworkingError()
            }
        }
    }
    
    func setupComments(with comments: [ImgurComment]) {
        var tempComments: [ImgurCommentCellPresenter] = []
        
        comments.forEach { comment in
            guard let commentText = comment.text else { return }
            let commentCell = ImgurCommentCellPresenter(view: nil, interactor: ImgurCommentCellInteractor(), comment: commentText)
            tempComments.append(commentCell)
        }
        
        if tempComments.isEmpty { view?.showNoCommentsView() }
        view?.comments = tempComments
    }
    
}

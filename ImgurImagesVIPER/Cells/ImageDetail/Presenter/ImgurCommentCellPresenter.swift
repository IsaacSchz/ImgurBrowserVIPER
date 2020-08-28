//
//  ImgurCommentCellPresenter.swift
//  ImgurImagesVIPER
//
//  Created by Isaac Sanchez on 04/08/20.
//  Copyright © 2020 Isaac Sanchez. All rights reserved.
//

import Foundation

class ImgurCommentCellPresenter {
    
    var comment: String
    
    private weak var view: ImgurCommentCellViewProtocol?
    private var interactor: ImgurCommentCellInteractorProtocol
    
    init(view: ImgurCommentCellViewProtocol?, interactor: ImgurCommentCellInteractorProtocol, comment: String) {
        self.view = view
        self.interactor = interactor
        self.comment = comment
    }
    
    init(view: ImgurCommentCellViewProtocol?, interactor: ImgurCommentCellInteractorProtocol) {
        self.view = view
        self.interactor = interactor
        self.comment = ""
    }
    
    func setView(_ view: ImgurCommentCellViewProtocol) {
        self.view = view
    }
}

extension ImgurCommentCellPresenter: ImgurCommentCellPresenterProtocol {
    
    func updateComment() {
        self.view?.commentText = comment
    }

}

//
//  ImgurPostCellPresenter.swift
//  ImgurImagesVIPER
//
//  Created by Isaac Sanchez on 04/08/20.
//  Copyright © 2020 Isaac Sanchez. All rights reserved.
//

import Foundation

class ImgurPostCellPresenter {
    
    // MARK: - VARIABLES
    
    var postId: String
    var imageUrl: URL
    var imageData: Data?
    var width: Double
    var height: Double
    
    private weak var view: ImgurPostCellViewProtocol?
    private var interactor: ImgurPostCellInteractorProtocol
    
    init(view: ImgurPostCellViewProtocol?, interactor: ImgurPostCellInteractorProtocol, postId: String, imageUrl: URL, width: Double, height: Double) {
        self.view = view
        self.interactor = interactor
        
        self.postId = postId
        self.imageUrl = imageUrl
        self.width = width
        self.height = height
    }
    
    init(view: ImgurPostCellViewProtocol?, interactor: ImgurPostCellInteractorProtocol) {
        self.view = view
        self.interactor = interactor
        
        self.postId = "1"
        self.imageUrl = URL(string: "http://www.apple.com")!
        self.width = 10.0
        self.height = 10.0
    }
    
    func setView(_ view: ImgurPostCellViewProtocol) {
        self.view = view
    }

}


extension ImgurPostCellPresenter: ImgurPostCellPresenterProtocol {

    func downloadImageData() {
        interactor.downloadImage(with: self.imageUrl) { [weak self] response in
            switch response {
            case .success(let imageData):
                self?.view?.imageData = imageData
                self?.imageData = imageData
            case .failure:
                self?.view?.imageData = nil
                self?.imageData = nil
            }
        }
    }
    
    func getCellHeight(for tableViewWidth: Float) -> Float {
        let ratio = self.height / self.width
        let newHeight = tableViewWidth * Float(ratio)
        return newHeight
    }
    
    
}



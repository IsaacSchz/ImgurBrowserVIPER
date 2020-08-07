//
//  ImageDetailWireFrame.swift
//  ImgurImagesVIPER
//
//  Created by Isaac Sanchez on 04/08/20.
//  Copyright © 2020 Isaac Sanchez. All rights reserved.
//

import Foundation

class ImageDetailWireframe: BaseWireframe {
    
    // MARK: - Module setup
    init( _ postId: String, _ postImageURL: URL) {
        let moduleViewController = ImageDetailViewController.loadFromStoryboard(storyboardName: "Main")
        super.init(viewController: moduleViewController)
        
        moduleViewController.postId = postId
        moduleViewController.postImageURL = postImageURL
        
        let interactor = ImageDetailInteractor()
        let presenter = ImageDetailPresenter(view: moduleViewController, interactor: interactor)
        moduleViewController.presenter = presenter
    }
}

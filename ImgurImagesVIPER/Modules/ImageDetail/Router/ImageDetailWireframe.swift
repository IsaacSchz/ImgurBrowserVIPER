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
    init( _ postId: String, _ postImageData: Data?) {
        let moduleViewController = ImageDetailViewController.loadFromStoryboard(storyboardName: "Main")
        super.init(viewController: moduleViewController)
        
        moduleViewController.postId = postId
        moduleViewController.postImageData = postImageData
        
        let interactor = ImageDetailInteractor()
        let presenter = ImageDetailPresenter(view: moduleViewController, interactor: interactor)
        moduleViewController.presenter = presenter
    }
}

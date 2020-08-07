//
//  ImagesBrowserWireframe.swift
//  ImgurImagesVIPER
//
//  Created by Isaac Sanchez on 04/08/20.
//  Copyright © 2020 Isaac Sanchez. All rights reserved.
//

import Foundation

class ImagesBrowserWireframe: BaseWireframe {
    
    init() {
        let moduleViewController = ImagesBrowserViewController.loadFromStoryboard(storyboardName: "Main")
        super.init(viewController: moduleViewController)
        let interactor = ImagesBrowserInteractor()
        let presenter = ImagesBrowserPresenter(view: moduleViewController, interactor: interactor)
        moduleViewController.presenter = presenter
    }
    
}

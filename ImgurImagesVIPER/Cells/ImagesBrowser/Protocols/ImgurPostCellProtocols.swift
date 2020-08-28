//
//  ImgurPostCellProtocols.swift
//  ImgurImagesVIPER
//
//  Created by Isaac Sanchez on 17/08/20.
//  Copyright © 2020 Isaac Sanchez. All rights reserved.
//

import Foundation

protocol ImgurPostCellViewProtocol: class {
    
    var imageData: Data? { get set }
    
}

protocol ImgurPostCellPresenterProtocol: class {
         
    func downloadImageData()
    
    func getCellHeight(for tableViewWidth: Float) -> Float

}

protocol ImgurPostCellInteractorProtocol: class {
        
    func downloadImage(with url: URL, completion: @escaping (Result<Data, ServiceConstants.NetworkingError>) -> Void)
    
}

//
//  ImagesBrowserEntity.swift
//  ImgurImagesVIPER
//
//  Created by Isaac Sanchez on 04/08/20.
//  Copyright © 2020 Isaac Sanchez. All rights reserved.
//

import Foundation

class ImgurResponse: Decodable {
    enum DataContainer: String, CodingKey {
        case data
    }
    
    let posts: [ImgurPost]?
    
    public required init(from decoder: Decoder) throws {
        let dataContainer = try decoder.container(keyedBy: DataContainer.self)
        posts = (try? dataContainer.decodeIfPresent([ImgurPost].self, forKey: .data))
    }
}


class ImgurPost: Decodable {
    enum CodigKeys: String, CodingKey {
        case id, title, images
    }
    
    let id: String?
    let title: String?
    let images: [ImgurImage]?
    
    
    public required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodigKeys.self)
        id = (try? container.decodeIfPresent(String.self, forKey: .id))
        title = (try? container.decodeIfPresent(String.self, forKey: .title))
        images = (try? container.decodeIfPresent([ImgurImage].self, forKey: .images))
        
    }
}

class ImgurImage: Decodable {
    
    enum CodigKeys: String, CodingKey {
        case id, link, width, height
    }
    
    let id: String?
    let imageURL: String?
    let width: Int?
    let height: Int?
    
    public required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodigKeys.self)
        id = (try? container.decodeIfPresent(String.self, forKey: .id))
        imageURL = (try? container.decodeIfPresent(String.self, forKey: .link))
        width = (try? container.decodeIfPresent(Int.self, forKey: .width))
        height = (try? container.decodeIfPresent(Int.self, forKey: .height))
    }
}



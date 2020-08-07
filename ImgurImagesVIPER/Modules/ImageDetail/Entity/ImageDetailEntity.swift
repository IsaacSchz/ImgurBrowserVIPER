
//
//  ImageDetailEntity.swift
//  ImgurImagesVIPER
//
//  Created by Isaac Sanchez on 04/08/20.
//  Copyright © 2020 Isaac Sanchez. All rights reserved.
//

import Foundation

class ImgurCommentsResponse: Decodable {
    enum DataContainer: String, CodingKey {
        case data
    }
    
    let comments: [ImgurComment]?
    
    public required init(from decoder: Decoder) throws {
        let dataContainer = try decoder.container(keyedBy: DataContainer.self)
        comments = (try? dataContainer.decodeIfPresent([ImgurComment].self, forKey: .data))
    }
}


class ImgurComment: Decodable {
    enum CodigKeys: String, CodingKey {
        case id, comment
    }
    
    let id: Int?
    let text: String?
    
    public required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodigKeys.self)
        id = (try? container.decodeIfPresent(Int.self, forKey: .id))
        text = (try? container.decodeIfPresent(String.self, forKey: .comment))
    }
}

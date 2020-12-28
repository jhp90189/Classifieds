//
//  ClassifiedsListResponse.swift
//  Classifieds
//
//  Created by Apple on 28/12/20.
//  Copyright © 2020 Jainesh Patel. All rights reserved.
//

import Foundation

struct ClassifiedsListResponse: Codable {
    let results: [Classified]
}

struct Classified: Codable {
    let created_at: String
    let price: String
    let name: String
    let image_ids: [String]
    let image_urls: [String]
    let image_urls_thumbnails: [String]
}

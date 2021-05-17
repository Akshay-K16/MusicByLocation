//
//  ArtistResponse.swift
//  MusicByLocation
//
//  Created by Khemaney, Akshay (SPH) on 17/05/2021.
//

import Foundation

struct ArtistResponse: Codable {
    var count: Int
    var results: [Artist]
    
    private enum CodingKeys: String, CodingKey {
        case count = "resultCount"
        case results
    }
}

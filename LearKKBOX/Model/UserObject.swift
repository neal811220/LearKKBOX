//
//  UserObject.swift
//  LearKKBOX
//
//  Created by Neal on 2020/1/17.
//  Copyright © 2020 neal812220. All rights reserved.
//

import Foundation

struct UserData: Codable {
    
    let accessToken: String
    
    let tokenType: String
    
    let expiresIn: Int
    
    enum CodingKeys: String, CodingKey {
        
        case accessToken = "access_token"
        
        case tokenType = "token_type"
        
        case expiresIn = "expires_in"
    }
}

struct Playlist: Codable {
    
    let data: [SongDetail]
    
    let paging: Paging
    
    let summary: Summary
}

struct SongDetail: Codable {
    
    let id: String
    
    let name: String
    
    let duration: Int
    
    let url: String
    
    let trackNumber: Int
    
    let explicitness: Bool
    
    let availableTerritories: [String]
    
    let album: Album
    
    enum CodingKeys: String, CodingKey {
        
        case id, name, duration, url, explicitness, album
        
        case trackNumber = "track_number"
        
        case availableTerritories = "available_territories"
    }
}

struct Paging: Codable {
    
    let offset: Int
    
    let limit: Int
    
    let previous: Int?
    
    let next: String?
}

struct Summary: Codable {
    
    let total: Int
}

struct Album: Codable {
    
    let id: String
    
    let name: String
    
    let url: String
    
    let explicitness: Bool
    
    let availableTerritories: [String]
    
    let releaseDate: String
    
    let images: [Images]
    
    let artist: Artist
    
    enum CodingKeys: String, CodingKey {
        
        case id, name, url, explicitness, images, artist
        
        case availableTerritories = "available_territories"
        
        case releaseDate = "release_date"
    }
}

struct Images: Codable {
    
    let height: Int
    
    let width: Int
    
    let url: String
}

struct Artist: Codable {
    
    let id: String
    
    let name: String
    
    let url: String
    
    let images: [SongImage]
}

struct SongImage: Codable {
    
    let height: Int
    
    let width: Int
    
    let url: String
}




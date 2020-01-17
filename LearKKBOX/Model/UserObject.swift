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
    
    let data: [songDetail]
    
    let paging: Paging
    
    let summary: Summary
}

struct songDetail: Codable {
    
    let id: String
    
    let name: String
    
    let duration: Int
    
    let url: String
    
    let trackNumber: Int
    
    let explicitness: Bool
    
    enum CodingKeys: String, CodingKey {
        
        case id, name, duration, url, explicitness
        
        case trackNumber = "track_number"
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


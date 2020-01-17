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

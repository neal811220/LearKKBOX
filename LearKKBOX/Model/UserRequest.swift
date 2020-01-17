//
//  UserRequest.swift
//  LearKKBOX
//
//  Created by Neal on 2020/1/17.
//  Copyright © 2020 neal812220. All rights reserved.
//

import Foundation

import Foundation
// MARK: - Navigation
enum KKUserRequest: KKRequest {
    
    case getToken(clientID: String, clientSecret: String, grandType: String)
    
    case getPlaylist(token: String)
    
    // MARK: - Navigation
    var headers: [String: String] {
        
        switch self {
            
        case .getToken:
            
            return [KKHTTPHeaderField.contentType.rawValue: KKHTTPHeaderValue.xwww.rawValue]
            
        case .getPlaylist(let token):
            
            return [KKHTTPHeaderField.auth.rawValue: KKHTTPHeaderValue.brarer.rawValue + " \(token)"]
        }
    }
    // MARK: - Navigation
    var body: Data? {
        
        switch self {
            
        case .getToken(let clientID, let clientSecret, let grandType):
            
        let parameters = "grant_type=\(grandType)&client_id=\(clientID)&client_secret=\(clientSecret)"
            
            return parameters.data(using: String.Encoding.utf8)
        case .getPlaylist:
            
            return nil
        }
        
    }
    // MARK: - Navigation
    var method: String {
        
        switch self {
            
        case .getToken: return KKHTTPMethod.POST.rawValue
            
        case .getPlaylist: return KKHTTPMethod.GET.rawValue
        }
    }
    // MARK: - Navigation
    var url: String {
        
        switch self {
            
        case .getToken: return "https://account.kkbox.com/oauth2/token HTTP/1.1"
        
        case .getPlaylist: return "https://api.kkbox.com/v1.1/new-hits-playlists/playlist_id/tracks"
        }
    }
    
}

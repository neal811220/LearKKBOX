//
//  UserProvider.swift
//  LearKKBOX
//
//  Created by Neal on 2020/1/17.
//  Copyright © 2020 neal812220. All rights reserved.
//

import Foundation

class UserProvider {
    
    func getUserToken(clientId: String, clientSecret: String, grantType: String, completion: @escaping (Result<Void>) -> Void) {
        
        HTTPClient.shared.request(KKUserRequest.getToken(clientID: clientId, clientSecret: clientSecret, grandType: "client_credentials")) { (result) in
            
            switch result {
                
            case .success(let data):
                do {
                    
                    let jsonData = try JSONDecoder().decode(UserData.self, from: data)
                    
                    print(jsonData)
                    
                    UserInfoManager.shared.setUserId(userid: jsonData.accessToken)
                    
                    completion(Result.success(()))
                    
                } catch {
                    
                    print(error)
                    completion(Result.failure((error)))
                }
                
                
            case .failure(let error):
                print(error)
            }
        }
    }
    
    func getPlaylist(userToken: String, completion: @escaping (Result<Playlist>) -> Void) {
        
        HTTPClient.shared.request(KKUserRequest.getPlaylist(token: userToken)) { (result) in
            
            switch result {
                
            case .success(let data):
                do {
                   
                    let json = try JSONDecoder().decode(Playlist.self, from: data)
                    
                    print(json)
                    
                    print(data)
                    
                    completion(Result.success(json))
                    
                } catch {
                    
                    print(error)
                    
                    completion(Result.failure(error))
                }
            case .failure(let error):
                
                print(error)
            }
        }
    }
}

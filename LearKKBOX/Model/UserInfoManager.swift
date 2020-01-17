//
//  UserInfoManager.swift
//  LearKKBOX
//
//  Created by Neal on 2020/1/17.
//  Copyright © 2020 neal812220. All rights reserved.
//

import Foundation

class UserInfoManager {
    
   static let shared = UserInfoManager()
    
    private init() { }
    
    var userToken = "useToken"
    
    func setUserId(userid: String) {
        
        UserDefaults.standard.set(userid, forKey: userToken)
    }
    
    func getUserId() -> String {
        
        guard let token = UserDefaults.standard.value(forKey: userToken) as? String else { return ""}
        
        return token
    }

}


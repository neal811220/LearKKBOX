//
//  Parser.swift
//  LearKKBOX
//
//  Created by Neal on 2020/1/17.
//  Copyright © 2020 neal812220. All rights reserved.
//

import Foundation

struct KKSuccessParser<T: Codable>: Codable{
    
    let data: T
    
    enum CodingKeys: String, CodingKey {
        
        case data
        
    }

}

struct KKFailureParser: Codable {

    let errorMessage: String
}



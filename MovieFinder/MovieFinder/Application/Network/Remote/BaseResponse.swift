//
//  BaseResponse.swift
//  Namava
//
//  Created by Arman on 1/25/25.
//

import Foundation

import Foundation

class BaseResponse: Decodable {
    enum RootKeys: CodingKey {
        case result, succeeded, error
    }
                        
    var succeeded: Bool
    var error: String?
    
    required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: RootKeys.self)
        
        succeeded = try container.decode(Bool.self, forKey: .succeeded)
        error = try container.decodeIfPresent(String.self, forKey: .error)
    }
    
    
}

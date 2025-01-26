//
//  ResultResponse.swift
//  Namava
//
//  Created by Arman on 1/25/25.
//

import Foundation

class ItemResponse<T: Decodable>: BaseResponse {
    
    var result: T
    
    required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: RootKeys.self)
        
        result = try container.decode(T.self, forKey: .result)
        try super.init(from: decoder)
    }
}

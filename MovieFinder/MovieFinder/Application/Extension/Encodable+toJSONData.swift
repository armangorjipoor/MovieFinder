//
//  Encodable+toJSONData.swift
//  Namava
//
//  Created by Arman on 1/25/25.
//

import Foundation

extension Encodable {
    public func toJSONData() -> Data? { try? JSONEncoder().encode(self) }
}

//
//  File.swift
//  MovieFinder
//
//  Created by Arman on 1/26/25.
//

import Foundation

extension JSONSerialization {
    static func printJSON(with data: Data) {
        do {
            let json = try JSONSerialization.jsonObject(with: data, options: .fragmentsAllowed)
            print("⏯️ 🔵 json \(json)")
            if let dict = json as? [String: Any] {
                print("⏯️ 🟢 dict \(dict)")
                if let JSONString = String(data: data, encoding: String.Encoding.utf8) {
                    print("⏯️ 🔴 JSONString \(JSONString)")
                }
            }
        } catch {
            print("⏯️ ❌\(error.localizedDescription)")
        }
    }
}

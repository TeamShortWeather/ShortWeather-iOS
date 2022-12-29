//
//  Encodable +.swift
//  ShortWeather
//
//  Created by Mac Book Pro on 2022/12/28.
//

import Foundation

extension Encodable {
    
    func asParameter() throws -> [String: Any] {
        let data = try JSONEncoder().encode(self)
        guard let dictionary = try JSONSerialization.jsonObject(with: data, options: .allowFragments)
                as? [String: Any] else {
            throw NSError()
        }
        return dictionary
    }
}



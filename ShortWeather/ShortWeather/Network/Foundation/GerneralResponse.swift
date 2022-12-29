//
//  GerneralResponse.swift
//  ShortWeather
//
//  Created by Mac Book Pro on 2022/12/28.
//

import Foundation

struct GeneralResponse<T: Decodable>: Decodable {
    var status: Int
    var message: String
    var data: T?

    enum CodingKeys: String, CodingKey {
        case status
        case message
        case data
    }

    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        status = (try? values.decode(Int.self, forKey: .status)) ?? 0
        message = (try? values.decode(String.self, forKey: .message)) ?? ""
        data = (try? values.decode(T.self, forKey: .data)) ?? nil
    }
}

//
//  CheckUserResponse.swift
//  ShortWeather
//
//  Created by Mac Book Pro on 2023/01/11.
//

import Foundation

struct CheckUserResponse: Codable {
    let deviceToken: String
    let accessToken: String
    let isExist: Bool
}

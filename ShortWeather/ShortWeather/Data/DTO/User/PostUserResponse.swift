//
//  PostUserResponse.swift
//  ShortWeather
//
//  Created by Mac Book Pro on 2023/01/11.
//

import Foundation

struct PostUserResponse: Codable {
    let id: Int
    let gender: String
    let age: String
    let tempSens: String
    let wakeUpTime: String
    let goOutTime: String
    let goHomeTime: String
    let deviceToken: String
    let accessToken: String
}

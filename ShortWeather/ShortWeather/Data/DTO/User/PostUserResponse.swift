//
//  PostUserResponse.swift
//  ShortWeather
//
//  Created by Mac Book Pro on 2023/01/11.
//

import Foundation

struct PostUserResponse: Codable {
    let id: Int
    let gender, age, tempSens, wakeUpTime: String
    let goOutTime, goHomeTime, deviceToken, accessToken: String
}

//
//  PostUserRequestDto.swift
//  ShortWeather
//
//  Created by Mac Book Pro on 2023/01/11.
//

import Foundation

struct PostUserRequest: Codable {
    let gender: String
    let age: String
    let tempSens: String
    let wakeUpTime: String
    let goOutTime: String
    let goHomeTime: String
    let deviceToken: String
}

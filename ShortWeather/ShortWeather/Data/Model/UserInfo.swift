//
//  InfoData.swift
//  ShortWeather
//
//  Created by Mac Book Pro on 2023/01/07.
//

import Foundation

struct UserInfo {
    let infoData: String
    let infoType: InfoType
}

enum InfoType {
    case gender
    case age
    case tempResponse
    case wakeUpTime
    case inTime
    case outTime
}

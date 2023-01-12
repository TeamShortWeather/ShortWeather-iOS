//
//  SecondTodayWeatherData.swift
//  ShortWeather
//
//  Created by 김민 on 2023/01/11.
//

import Foundation

enum DustState: Int {
    case good = 1
    case normal = 2
    case bad = 3
    case worst = 4
    
    func setDustIcon() -> String {
        switch self {
        case .good: return "icn_dust_good"
        case .normal: return "icn_dust_normal"
        case .bad: return "icn_dust_bad"
        case .worst: return "icn_dust_worst"
        }
    }
}

struct GoOut: Codable {
    let time: String
    let temp: Int
    let day: Bool
    let image: String
}

struct GoHome: Codable {
    let time: String
    let temp: Int
    let day: Bool
    let image: String
}

struct TodayWeather: Codable {
    let humidity: Int
    let sunrise: String
    let sunset: String
    let fineDust: Int
    let ultraFineDust: Int
}

struct SecondTodayWeather: Codable {
    let location: String
    let goOut: GoOut
    let goHome: GoHome
    let todayWeather: TodayWeather
    
    public static func dummyData() -> SecondTodayWeather {
        return SecondTodayWeather(location: "서울, 중구 명동",
                                  goOut: GoOut(time: "0800", temp: 1, day: true, image: "맑음"),
                                  goHome: GoHome(time: "2100", temp: -3, day: false, image: "구름많음"),
                                  todayWeather: TodayWeather(humidity: 87, sunrise: "0747", sunset: "1731", fineDust: 0, ultraFineDust: 0))
    }
}

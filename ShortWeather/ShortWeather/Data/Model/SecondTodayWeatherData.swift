//
//  SecondTodayWeatherData.swift
//  ShortWeather
//
//  Created by 김민 on 2023/01/11.
//

import Foundation

struct GoOut {
    let time: String
    let temp: Int
    let day: Bool
    let image: String
}

struct GoHome {
    let time: String
    let temp: Int
    let day: Bool
    let image: String
}

struct TodayWeather {
    let humidity: Int
    let sunrise: String
    let sunset: String
    let fineDust: Int
    let ultraFineDust: Int
}

struct SecondTodayWeather {
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

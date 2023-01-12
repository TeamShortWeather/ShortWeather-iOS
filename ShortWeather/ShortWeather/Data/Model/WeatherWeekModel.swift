//
//  WeatherWeekModel.swift
//  ShortWeather
//
//  Created by KJ on 2023/01/12.
//

import Foundation

struct WeatherWeekModel {
    let day: String
    let date: String
    let dayImage: String
    let dayRain: Int
    let nightImage: String
    let nightRain: Int
    let isDay: Bool
    let minTemp: Int
    let maxTemp: Int
    
    public static func weatherWeekdummyData() -> WeatherWeekModel {
        return WeatherWeekModel(day: "일", date: "0112", dayImage: "맑음", dayRain: 50, nightImage: "구름많음", nightRain: 0, isDay: true, minTemp: -1, maxTemp: 9)
    }
}

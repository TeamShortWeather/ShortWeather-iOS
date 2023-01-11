//
//  TodayWeatherDetailDto.swift
//  ShortWeather
//
//  Created by 김민 on 2023/01/11.
//

import Foundation

// MARK: - TodayWeatherDetailResponse

struct DetailWeather: Codable {
    let location: String
    let goOut: GoOut
    let goHome: GoHome
    let todayWeather: TodayWeather
    
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
}

struct DetailTemp: Codable {
    let date: String
    let time: String
    let temperature: Int
    let day: Bool
    let image: String
    
    func convertToDetailTemp() -> TimezoneWeatherData {
        return TimezoneWeatherData(date: self.date, time: self.time, temperature: self.temperature, day: self.day, image: self.image)
    }
}

struct DetailRain: Codable {
    let date: String
    let time: String
    let rain: Int
    
    func convertToDetailRain() -> TimezonePrecipitationData {
        return TimezonePrecipitationData(date: self.date, time: self.time, rain: self.rain)
    }
}

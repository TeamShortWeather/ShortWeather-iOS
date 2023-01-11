//
//  TodayWeatherDetailDto.swift
//  ShortWeather
//
//  Created by 김민 on 2023/01/11.
//

import Foundation

// MARK: - TodayWeatherDetailResponse

struct DetailGoOut: Codable {
    let time: String
    let temp: Int
    let day: Bool
    let image: String
}

struct DetailGoHome: Codable {
    let time: String
    let temp: Int
    let day: Bool
    let image: String
}

struct DetailTodayWeather: Codable {
    let humidity: Int
    let sunrise: String
    let sunset: String
    let fineDust: Int
    let ultraFineDust: Int
}

struct DetailWeatherResponse: Codable {
    let location: String
    let goOut: DetailGoOut
    let goHome: DetailGoHome
    let todayWeather: DetailTodayWeather
    
//    func convertToSecondWeather() -> SecondTodayWeather {
//        return SecondTodayWeather(location: self.location, goOut: self.goOut, goHome: self.goHome, todayWeather: self.todayWeather)
//    }
}

struct DetailTempResponse: Codable {
    let date: String
    let time: String
    let temperature: Int
    let day: Bool
    let image: String
    
    func convertToDetailTemp() -> TimezoneWeatherData {
        return TimezoneWeatherData(date: self.date, time: self.time, temperature: self.temperature, day: self.day, image: self.image)
    }
}

struct DetailRainResponse: Codable {
    let date: String
    let time: String
    let rain: Int
    
    func convertToDetailRain() -> TimezonePrecipitationData {
        return TimezonePrecipitationData(date: self.date, time: self.time, rain: self.rain)
    }
}
